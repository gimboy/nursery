**1.** 
- Используя команду ***cat*** в терминале операционной системы ***Linux***, создать
два файла ***Домашние животные*** ( заполнив файл *собаками*, *кошками*,
*хомяками* ) и ***Вьючные животными*** заполнив файл *лошадьми*, *верблюдами* и
*ослы*), а затем объединить их. 
- Просмотреть содержимое созданного файла.
- Переименовать файл, дав ему новое имя ( ***Друзья человека*** ).

```
gimboy@gb-linux:~$ cat > Pets
1.Dog Sharik
2.Dog Rex
3.Dog Roy

1.Cat Kity
2.Cat Neco
3.Cat Tolik

1.Hamster Kol
2.Hamster Tomi
3.Hamster Solya
gimboy@gb-linux:~$ cat > Pack_animal
1.Horse Bravo
2.Horse Anna
3.Horse Narua

1.Camel Ani
2.Camel Osean
3.Camel Som

1.Donkey Tim
2.Donkey Katya
3.Donkey Bob

gimboy@gb-linux:~$ cat Pets Pack_animal > Animals
gimboy@gb-linux:~$ more Animals
gimboy@gb-linux:~$ mv Animals Friends_man

**2.** 
- Создать директорию, переместить файл туда.

gimboy@linux:~$ mkdir Animal
gimboy@linux:~$ mv Friends_man Animal
**3.** 
- Подключить дополнительный репозиторий ***MySQL***. 
- Установить любой пакет из этого репозитория.

```
gimboy@gb-linux:~$ sudo su
root@gb-linux:/home/dm# wget https://repo.mysql.com//mysql-apt-config_0.8.24-1_all.deb
root@gb-linux:/home/dm# dpkg -i mysql-apt-config_0.8.24-1_all.deb
root@gb-linux:/home/dm# apt update
root@gb-linux:/home/dm# apt install mysql-server

**4.** 
- Установить и удалить ***deb-пакет*** с помощью ***dpkg***.
```
gimboy@linux:~$ apt download apache2
gimboy@linux:~$ sudo dpkg -i apache2_2.4.52-1ubuntu4.3_amd64.deb
gimboy@linux:~$ sudo dpkg -r apache2


**5.** 
- Выложить историю команд в терминале ***ubuntu***.



