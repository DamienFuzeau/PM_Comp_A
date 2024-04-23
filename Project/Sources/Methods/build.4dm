//%attributes = {}
var $version : Text:=File("/RESOURCES/version.txt").getText()
$version:=Request("Version:"; $version)
If (OK=1)
	File("/RESOURCES/version.txt").setText($version)
	
	BUILD APPLICATION(File(Build application settings file).platformPath)
	
	ALERT(OK=1 ? "Build complete" : "Build failed")
	
	If (OK=1)
		var $zipFile:=File("/PACKAGE/Build/Components/PM_Comp_A.zip")
		If ($zipFile.exists)
			$zipFile.delete()
		End if 
		$zip:=ZIP Create archive(Folder("/PACKAGE/Build/Components/PM_Comp_A.4dbase"); $zipFile)
	End if 
	
End if 
