if (Get-Package | Where-Object Name -Like "*McAfee*") {
	Write-Host "Uninstalling McAfee products..."
    # Download MCPR from here, upload to your hosting provider https://www.mcafee.com/support/s/article/000001616?language=en_US
	$url = "https://download.mcafee.com/molbin/iss-loc/SupportTools/MCPR/MCPR.exe"
	$destination = "C:\temp\MCPR.zip"
	Invoke-WebRequest -Uri $url -OutFile $destination
	Expand-Archive -LiteralPath "C:\temp\MCPR.zip" -DestinationPath "C:\temp" -Force
	$MCPR = "C:\temp\MCPR\Mccleanup.exe"
    # Run the tool silently
    #Start-Process -FilePath $MCPR -ArgumentList "-p StopServices,MFSY,PEF,MXD,CSP,Sustainability,MOCP,MFP,APPSTATS,Auth,EMproxy,FWdiver,HW,MAS,MAT,MBK,MCPR,McProxy,McSvcHost,VUL,MHN,MNA,MOBK,MPFP,MPFPCU,MPS,SHRED,MPSCU,MQC,MQCCU,MSAD,MSHR,MSK,MSKCU,MWL,NMC,RedirSvc,VS,REMEDIATION,MSC,YAP,TRUEKEY,LAM,PCB,Symlink,SafeConnect,MGS,WMIRemover,RESIDUE -v -s" -Wait -NoNewWindow
	& "C:\temp\MCPR\Mccleanup.exe" -p StopServices,MFSY,PEF,MXD,CSP,Sustainability,MOCP,MFP,APPSTATS,Auth,EMproxy,FWdiver,HW,MAS,MAT,MBK,MCPR,McProxy,McSvcHost,VUL,MHN,MNA,MOBK,MPFP,MPFPCU,MPS,SHRED,MPSCU,MQC,MQCCU,MSAD,MSHR,MSK,MSKCU,MWL,NMC,RedirSvc,VS,REMEDIATION,MSC,YAP,TRUEKEY,LAM,PCB,Symlink,SafeConnect,MGS,WMIRemover,RESIDUE -v -s
	Remove-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\McAfee.WPS" -Recurse -ErrorAction SilentlyContinue
    # Remove the downloaded file
    Remove-Item -Path $destination -Force
	Write-Host "Uninstall completed, please reboot"
}
