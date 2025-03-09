#v Задание 14.

1. Исправить ошибки в скрипте без изменения вида скрипта. Скрипт должен выдавать на экран текущий временный каталог и активный каталог.
      ```sh
      #!/bin/bash
      #set -x
      declare FILE=test.txt
      declare SHM=/dev/shm
      declare TMP=/tmp
      declare CURTMP
      
      cd 
      ls "$SHM" && { cd $SHM; touch "$FILE"; CURTMP=$SHM;} || { cd $TMP; touch "$FILE"; CURTMP=$TMP;}
      echo "$CURTMP" 
      pwd
      ```
      <img width="545" alt="image" src="https://github.com/user-attachments/assets/bfd8b5f0-0a1f-4a4e-a8eb-9b8eae24e2cc" />
1.1. Привести скрипт к виду одна команда в строке.
  ```sh
  cd 
  ls "$SHM" && { 
  cd $SHM
  touch "$FILE"
  CURTMP=$SHM
  } || { 
  cd $TMP
  touch "$FILE"
  CURTMP=$TMP
  }
  echo "$CURTMP" 
  pwd
  ```
2. Изменить скрипт, используя группировку (...). Результат выполнения должен быть аналогичен п.1
      <img width="619" alt="image" src="https://github.com/user-attachments/assets/7feb1728-d3d3-46e2-bbb6-9c6c85181db9" />
      
      Вот что получится, если просто заменить { на (. :( Тогда добавляем вывод в оболочку.
      ```sh
      cd 
      ls "$SHM" && ( 
      cd $SHM
      touch "$FILE"
      CURTMP=$SHM
      echo "$CURTMP" 
      pwd
      ) || ( 
      cd $TMP
      touch "$FILE"
      CURTMP=$TMP
      echo "$CURTMP" 
      pwd
      )
      ```
3. С помощью  ключа добиться вывода двух каталогов в одной строке через пробел.
    ```sh
    echo -n "$CURTMP" " " && pwd
    ```
4. Изменить скрипт п.3 чтобы на экран не выводилось ничего кроме требуемых каталогов.
     ```sh
    ls "$SHM" > /dev/null && (
     ```
5. Конструкции типа  prg1 && prg2 || echo "ERR"  и  prg1 || prg2 && echo "OK" имеют неприятную особенность.  
5.1 Назвать особенность.
    ```sh
    Проследить логику тяжело: оператор && (и) имеет приоритет над || (или)
     ```
5.2 С помощью группировки вместо prg2 сделать конструкции логичными (чтобы особенность п5.1 не могла проявится при любых результатах выполнения)  
  ```sh
  { prg1 && prg2; } || echo "ERR"         # Выполнились И 1 И 2 - не выводим ERR. 1 ИЛИ 2 НЕ выполнились - получите ERR
  { prg1 || prg2; } && echo "OK"          # И 1 И 2 выполнились - получите OK. Иначе ничего.
  ```
5.3 протестировать 5.1 и 5.2, заменив prg1,2 программами  true и false в различных сочетаниях.  
  ```sh
  { true || true; } && echo "OK"       # ТОЛЬКО ТАК БУДЕТ ОК
  { true && true; } || echo "ERR"      # ТОЛЬКО ТАК НЕ БУДЕТ ERR
  ```
