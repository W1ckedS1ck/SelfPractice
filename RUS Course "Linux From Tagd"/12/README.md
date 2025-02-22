#v Задание 12.

0. Самостоятельное изучение команд du df
```
man du # Disk Usage - сколько места занимают файлы и каталоги
man df # Disk free  - информации о доступном и занятом пространстве
```
1. Написать скрипт, в котором описаны переменные:
целые I,J,K
обычные массивы A7, B13
переменные для экспорта PA, VASYA
```
declare -i I J K          # i - целые переменные (int)
declare -a A7 B13         # a - обычные массивы  (array)
declare -x PA VASYA       # x - экспорт переменной (xport)
```
2. Задать произвольные  начальные значения всем переменным.
```
I=3 J=5 K=I+2*J                            # echo "I=$I, J=$J, K=$K"
A7=("a1" "a2" "a7") B13=("b1" "b13")       # echo "${A7[@]} ${B13[@]}"
PA="Ya" VASYA="Vitalik"                    # echo "$PA $VASYA"
```
3. Cнять опцию экспорта для переменной VASYA
```
declare +x VASYA
```
4. Описать переменные I3 -как целую, B - как текстовую верхнего регистра. (переменным значения не задавать)
```
declare -i I3 
declare -u B            # u - верхний регистр (uppercase)
```
5. Присвоить переменной B значение yes, Переменной I значение "no", переменной PA значение Сегодня в школу не пойдем!
```
B=yes I=no
PA="Сегодня в школу не пойдем!"             # echo "$PA $I $B"
```
6. С помощью команды echo распечатать значения всех описанных выше  переменных. В виде: echo "VAR=$VAR"
```
echo "$I $J $K ${A7[@]} ${B13[@]} $PA $VASYA $I $B "        # вывод - 0 5 20 a1 a2 a7 b1 b13 Сегодня в школу не пойдем! Vitalik 0 YES. 
# ПОСКОЛЬКУ I - целая, а мы сделали I=no - вывод получился 0!
```
7. Вывести  на экран значения и описание всех переменных из п.6 с помощью declare. Сделать вывод о значениях переменных и удобстве применения команд для контроля значений переменных.
```
declare -p I J K A7 B13 PA VASYA I B

#ВЫВОД
declare -i I="0"
declare -i J="5"
declare -i K="20"
declare -a A7=([0]="a1" [1]="a2" [2]="a7")  # 0 - певая ячейка, 1 - вторая.
declare -a B13=([0]="b1" [1]="b13")
declare -- PA="Сегодня в школу не пойдем!"
declare -- VASYA="Vitalik"
declare -i I="0"
declare -u B="YES"
```
8. Значения каких переменных могут быть использованы без знака $ и в каком случае? Можно ли переменной, описанной как массив присвоить значение "1". 
```
Если работаем с dealare и unset $ можно опускать.
declare -a ARR=1 ; echo $ARR    # ВЫДАЕТ 1. можно.
```

9. Написать скрипт. В скрипте задать переменные HOME_DIR, FILE_NAME, FILE_EXT.  (значения на Ваше усмотрение)
Создать файл с таким именем, Создать резервную копию файла с полным именем и суффиксом ".1" на конце. Удалить исходный файл. Восстановить исходный файл с помощью команды переименования. Результат каждой операции подтверждать с помощью списка каталога. Все возможные ошибки выводить на экран и в лог-файл с полным именем и суффиксом .err
```
set -x
HOME_DIR=$(pwd) FILE_NAME=file FILE_EXT=txt              # echo "$HOME_DIR" $FILE_NAME $FILE_EXT 
pwd                                                      # /
cd $HOME_DIR/                                            # /Users/Vitali_K/temp
echo "$HOME_DIR" > "$FILE_NAME.$FILE_EXT"                # -rw-r--r--   1 Vitali_K  staff    24 Feb 22 16:37 file.txt
cp "$FILE_NAME.$FILE_EXT" "$FILE_NAME.$FILE_EXT.1"       # file.txt        file.txt.1
rm "$FILE_NAME.$FILE_EXT"                                # file.txt.1
mv "$FILE_NAME.$FILE_EXT.1" "$FILE_NAME.$FILE_EXT"       # file.txt
 cat file.txt                                           # /Users/Vitali_K/temp
set -x

# ВЫВОД
bash script.sh 
++ pwd
+ HOME_DIR=/Users/Vitali_K
+ FILE_NAME=file
+ FILE_EXT=txt
+ pwd
/Users/Vitali_K
+ cd /Users/Vitali_K/
+ echo /Users/Vitali_K
+ cp file.txt file.txt.1
+ rm file.txt
+ mv file.txt.1 file.txt
+ cat file.txt
/Users/Vitali_K
+ set +x
```