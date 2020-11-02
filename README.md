# get_packet_asust
Get packet from ASUST-TST-SUPPORT

**.SYNOPSIS**

   Get packet from internal support site ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА"

   Author: Dmitry Demin dmitrydemin1973@gmail.com

**.DESCRIPTION**

  Get packet from internal support site, create directory D:\Region\updates\2020_11_02\14534 and zip archive check.

**.PARAMETER packet**

  Specify the packet for dowload. 

**.PARAMETER dir_patches**

 Specify the directory for packet. 

**.PARAMETER userasustsite**

  Specify the name of user asust site. 

**.PARAMETER passasustsite**

  Specify the password of user asust site. 

**.EXAMPLE**

  Get packet 14534 and save to directory D:\Region\updates\2020_11_02\14534\ 

    .\get_packet_asust.ps1 -packet 14534 -dir_patches  D:\Region\updates\ -userasustsite user_name  -passasustsite password


