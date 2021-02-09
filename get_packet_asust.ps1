<#
    .SYNOPSIS
     Get packet from internal support site ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА"

     Author: Dmitry Demin dmitrydemin1973@gmail.com

    .DESCRIPTION
    Get packet from internal support site, create directory D:\Region\updates\2020_11_02\14534 and zip archive check , unzip to specify directory.

    .PARAMETER packet
    Specify the packet for dowload. 

    .PARAMETER dir_patches
    Specify the directory for packet. 

    .PARAMETER userasustsite
    Specify the name of user asust site. 

    .PARAMETER passasustsite
    Specify the password of user asust site. 

    .EXAMPLE
    Get packet 14534 and save to directory D:\Region\updates\2020_11_02\14534\ 
    .\get_packet_asust.ps1 -packet 14534 -dir_patches  D:\Region\updates\ -userasustsite user_name  -passasustsite password
#>


param(
[string]$packet = "14534", 
[string]$dir_patches = "D:\Region\updates\",
[string]$userasustsite = "",
[string]$passasustsite = ""
)




$patch_input_in=$packet
$urlsiteroot="http://10.161.98.7:8080/"
$url_site=$urlsiteroot+"seePO.do?id="
$url_relese="href=/ReleaseDir/"
$url_relese2="href=`"download/"
$url_href="href="
$lengthhref=$url_href.length
$url_href2="href=`""
$right_angle_bracket="`">"
$right_angle_bracket_only=">"
$left_angle_bracket_only="<"
$semicolon=";"
$doublequote="`""
$emptystring=""
$space=" "
$parametername="name="
$lengthhref2=$url_href2.length
$zipext=".zip"
$zipok="Everything is Ok"
$zip="C:\Program Files\7-Zip\7z.exe"
$ziptest="t"
$ziplist="l"
$zipextract="x"
$damagezip_string="damagezip_"
$backslash="\"
$forwardlash="/"
$underscore="_"

$dirdate=get-date -format "yyyy-MM"

$dir_patches=$dir_patches+ $dirdate+$backslash

$isoutput = Test-Path $dir_patches

if($isoutput -ne "True") {
   New-Item -ItemType Directory -Path $dir_patches | Out-Null
   Write-Host "Create patches dir: $dir_patches"
}


$dir_patches = $dir_patches+$patch_input_in

Add-Type -AssemblyName System.Web

$isoutput = Test-Path $dir_patches

if($isoutput -ne "True") {
   New-Item -ItemType Directory -Path $dir_patches | Out-Null
   Write-Host "Create patches dir: $dir_patches"
}
else {
    $Creation_date_dir=Get-Item $dir_patches | Select-Object -Property CreationTime
    $s_creationdate=$Creation_date_dir.CreationTime.ToString("yyyy-MM-dd")  
    $renamepath_dir=$dir_patches+"  "+$s_creationdate
    Write-Host "Creation date dir $dir_patches is : $s_creationdate  will be rename to :   $renamepath_dir "
    Rename-Item  -Path $dir_patches $renamepath_dir
    New-Item -ItemType Directory -Path $dir_patches | Out-Null
    Write-Host "Create patches dir: $dir_patches"
}


$pair = "$($userasustsite):$($passasustsite)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

$url_packet=$url_site+$patch_input_in

$html_packet=Invoke-WebRequest -Uri $url_packet -Headers $Headers

$links_1=$html_packet.allelements 

$links_1=$links_1 -split $left_angle_bracket_only

#
#http://10.161.98.7:8080/ReleaseDir/_R.6.05/TSTPackage[_R.6.05](04.09.2019_05-27)[TO_GRST_New].7tst
#

$links_2=$links_1 | where {$_ -notlike $emptystring } |where {$_ -like  "*"+$url_relese+"*" }

$countfile=1

foreach ($link in $links_2)
{
Write-Host "------------------------------------------------------------------------"

#Write-Host  $link

$urlsplit= $link -split $semicolon
	
for ($i = 0; $i -le ($urlsplit.length - 1); $i += 1) {

if (($urlsplit[$i]).Contains($url_relese) ) 
{

$urldownload=$urlsplit[$i].Replace($url_href,$urlsiteroot)
$filename=$urlsplit[$i].Replace($url_relese,$emptystring)
$positioncut=$filename.LastIndexOf($forwardlash)

$filename=$filename.substring($positioncut+1)

Write-Host  $urldownload
#Write-Host  $filename
$tempfilename=$dir_patches+$backslash+$countfile+$zipext


$html_download=Invoke-WebRequest -Uri $urldownload -Headers $Headers -OutFile $tempfilename
$zipoutputfull = & $zip $ziptest $tempfilename 

if ($zipoutputfull.Contains($zipok))
{
Write-Host $zipok
$damagezip=$emptystring
}
else {
Write-Host $zipoutputfull
$damagezip=$damagezip_string
}

$fullfilename=$dir_patches+$backslash+$damagezip+$countfile+$underscore+$filename.Replace($space,$emptystring)
Write-Host  $fullfilename

Rename-Item -LiteralPath $tempfilename -NewName $fullfilename
$countfile=$countfile+1
}


}

}



#http://10.161.98.7:8080/download/MRM_FN.pdc?rej=po&id_att=10300&name=MRM_FN.pdc
#<a style="padding-left: 3px;" class="link_black" target="_blank" href="download/MRM_FN.pdc?rej=po&amp;id_att=10300&amp;name=MRM_FN.pdc">MRM_FN.pdc</a>

$links_11=$html_packet -split $right_angle_bracket_only

$links_3=$links_11 | where {$_ -notlike $emptystring } |where {$_ -like  "*"+$url_relese2+"*" } 

foreach ($link in $links_3)
{
Write-Host "------------------------------------------------------------------------"

$urlsplit= $link -split $semicolon
    
for ($i = 0; $i -le ($urlsplit.length - 1); $i += 1) {

if (($urlsplit[$i]).Contains($url_relese2) ) 
{

$urldownload=$urlsplit[$i]

$positionstringstart=$urldownload.LastIndexOf($url_href2)

$urldownload=$urldownload.substring($positionstringstart+$lengthhref2 )
$urldownload=$urldownload.Replace($doublequote,$emptystring)

$urldownload=$urlsiteroot+$urldownload

$filedownload=[System.Web.HttpUtility]::UrlDecode($urldownload)

$positionstring2=$filedownload.LastIndexOf($parametername)
$filename=$filedownload.substring($positionstring2+$lengthhref)

Write-Host  $urldownload
#Write-Host  $filename

$tempfilename=$dir_patches+$backslash+$i

$fullfilename=$dir_patches+$backslash+$filename
Write-Host  $fullfilename
$html_download=Invoke-WebRequest -Uri $urldownload -Headers $Headers -OutFile $tempfilename
Rename-Item -LiteralPath $tempfilename -NewName $fullfilename
}

}

}

