
# get_packet_asust.exe 

**.SYNOPSIS**

   Скачивание пакетов обновлений с сайта тех. поддержки ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА"

   Author: Dmitry Demin dmitrydemin1973@gmail.com

**.DESCRIPTION**

  Скачивание пакетов обновлений, скриптов sql и всех документов входящих в обновление, с сайта тех. поддержки ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА".
  
  Скаченные пакеты проверяются на целостность архива.
  
  Для работы требует установленный 

  Скомпилированный скрипт get_packet_asust.ps1 не требует разрешения на запуск powershell скриптов.

**.PARAMETER packet**

  Номер пакета АСУ СТ 

**.PARAMETER dir_patches**

 Корневая директория для скачивания пакетов. Структура директорий dir_patches\<YYYY-MM-DD>\<номер пакета>
 В случае существования директории и ранее скаченных файлов, старая директория копируется в директорию  dir_patches\<YYYY-MM-DD>\<номер пакета YYYY-MM-DD>

**.PARAMETER userasustsite**

 Имя пользователя сайта тех.поддержки АСУ СТ.

**.PARAMETER passasustsite**

  Пароль пользователя сайта тех.поддержки АСУ СТ.

**.EXAMPLE**

  Скачивание пакета 14534 и сохранение в директорию D:\Region\updates\2020_11_02\14534\ 

     get_packet_asust.exe -packet 14534 -dir_patches  D:\Region\updates\ -userasustsite user_name  -passasustsite password




# get_packet_asust.ps1 powershell script 

Get packet from site ASUST-TST-SUPPORT 

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


