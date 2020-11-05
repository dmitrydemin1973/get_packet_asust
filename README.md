
# get_packet_asust.exe 

**.SYNOPSIS**

   Скачивание пакетов обновлений с сайта тех. поддержки ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА"

   Author: Dmitry Demin dmitrydemin1973@gmail.com

**.DESCRIPTION**

  Скачивание пакетов обновлений, скриптов sql и всех документов входящих в обновление, с сайта тех. поддержки ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА".
  
  Скаченные пакеты проверяются на целостность архива.
  
  Для работы требует установленный архиватор 7z.exe в директорию "C:\Program Files\7-Zip\7z.exe"

  Скомпилированный скрипт get_packet_asust.exe не требует разрешения на запуск powershell скриптов.

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

**.SYNOPSIS**

   Скачивание пакетов обновлений с сайта тех. поддержки ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА"

   Author: Dmitry Demin dmitrydemin1973@gmail.com

**.DESCRIPTION**

  Скачивание пакетов обновлений, скриптов sql и всех документов входящих в обновление, с сайта тех. поддержки ООО "НТЦ ТРАНССИСТЕМОТЕХНИКА".
  
  Скаченные пакеты проверяются на целостность архива.
  
  Для работы требует установленный архиватор 7z.exe в директорию "C:\Program Files\7-Zip\7z.exe"

  Скрипт get_packet_asust.ps1 **требует разрешения на запуск powershell скриптов.**
  
  Для изменения политики выполнения на неограниченную, надо воспользоваться консолью PowerShell, открытую с правами Администратора и выполнить следующую команду:

      Set-ExecutionPolicy Unrestricted

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

     powershell .\get_packet_asust.ps1 -packet 14534 -dir_patches  D:\Region\updates\ -userasustsite user_name  -passasustsite password

