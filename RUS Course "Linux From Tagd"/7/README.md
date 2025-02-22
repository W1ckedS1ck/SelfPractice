#v Задание 7

0. Просмотреть man следующих команд: touch, ls. chmod, mkdir, rmdir, rm
```
man touch (etc)
```
1. Написать одним предложением, что кроме создания файла может делать touch.
```
Менять время файла (атрибуты апдейта или обращения), создавать пустые файлы
```
2. ls  - записать назначение ключей t,S,X,r,h. Проверить на папке /usr/bin
```
-t = sort by time, newest first
-S = sort by file size, largest first
-X = отсортировать по расширению
-r = reverse
-h = удобочитаемый (вид в гигах)
```
3. chmod объяснить ключ -v -R
```
-v = дебаг режим (вербоз)
-R = --recursive - относится не только к файлу а ко всем файлам и папкам внутри
```
4. mkdir объяснить ключ -m -v
```
-m = set file mode (as in chmod)
```
5. НЕ ВЫПОЛНЯТЬ. rm записать действия ключей -r -f -i -v
```
-f, --force = игнор интерактива с пользователем (-i "наоборот")
-r, -R, --recursive
-i     prompt before every removal
-v, --verbose
```
6. НЕ ВЫПОЛНЯТЬ rmdir  записать действие ключа  --ignore-fail-on-non-empty
```
--ignore-fail-on-non-empty = ignore each failure to remove a non-empty directory
```
7. Протестировать команду type на различных командах/программах, включая printf.
```
type printf = printf is a shell builtin
type man = man is /usr/bin/man
```
8. Самостоятельно изучить команду which, сравнить командой type. Сделать вывод для чего можно применить команду which.
```
type man = man is /usr/bin/man
which man = /usr/bin/man

printf is a shell builtin (встроенная в оболочку программа)
printf is /usr/bin/printf (путь по которому лежит бинарник)
printf is /bin/printf (а /bin/printf -  ссылка на /usr/bin/printf)
```
9. Придумать(вспомнить и поделиться) каким-нибудь нужным alias'ом.
```
alias ll='ls -alF' (встройка в Убунту)
```