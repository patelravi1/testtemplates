#$subscriptionId = "1d6f8625-52ba-4273-a625-5a5008b3ae07";
Add-AzureRmAccount
#Login-AzureRmAccount
#Select-AzureRmSubscription -SubscriptionID $subscriptionId;

$starttime = Get-Date;
$endtime = $starttime.AddMinutes(30);
$scontext = Get-AzureRmStorageAccount -ResourceGroupName "Ravi_Patel" -AccountName "sastesting"
$sas = New-AzureStorageBlobSASToken -Container "sastesting" -Blob "ARMTest.ps1" -Permission rwd -StartTime $StartTime -ExpiryTime $EndTime -Context $scontext.Context

$url = "https://sastesting.blob.core.windows.net/sastesting/ARMTest.ps1" + $sas

$Script = Invoke-WebRequest $url
$ScriptBlock = [Scriptblock]::Create($Script.Content)
Invoke-Command -ScriptBlock $ScriptBlock
# -ArgumentList ($args + @('someargument'))

#$JSON = (Invoke-webrequest -URI $url).Content

#$JSON