.intel_syntax noprefix
.text
.model tiny
.stack 100h
data segment
    string db 10,13,100 dup ('$');//вводимая строка
    ;Probel db 20 dup (0)   ;//смещенеия пробелов
    Lenstr dw (0)       ;//длина строки
    Rez db 100 dup (0)  ;//результат на вывод 
    str_ent db  13, 10, '$'     ;// перевод на следующую строку
data ends
 
code segment
assume cs:code,ds:data
start:
    mov ax, data    ;//в регистр ах помещаем смещение строчки
    mov ds, ax  ;//в регистр ds помещаем смещение строчки,
            ;//т.к. напрямую записать в ds мы не можем
    xor cx,cx
    xor dx, dx  ;//обнуляем dx
    mov cx, 99  ;//установка счетчика
    lea bx, string+1;//поиск начала строки
    ;lea si,Probel  ;//поиск начала строки с пробелами
        mov ah, 1   ;//функция ввода с клавиатуры
m1:
    int 21h

    mov [bx], al    ;//помещаем символ в ячейку с адресом [bx]
    inc bx      ;bx=bx+1
    cmp al, 13     ;//текст кончается enter
    je m2
    inc Lenstr
loop m1

m2:
    mov cx, Lenstr  ;//длину строки в счетчик
    lea bx, String  ;//начало строки в bx
    lea dx, Rez ;//начало строки в dx

m3:
    cmp cx, 0   ;//не равен ли счетчик 0
    je exit     ;//равен=> к метке exit
    dec cx
    inc bx      ;//переход к след элементу(на начальном этапе перешли к первой букве,
            ;//т к в первой ячейке сироки лежит ее макс возможная длина)
    mov al, [bx]    ;//в аккумулятор содержимое ячейки из String  
    cmp al, 'a' ;//сравниваем с "а"
    je m4       ;//равен,переходим к метке m4
    cmp al, ' ' ;//сравниваем с пробелом
    je m3       ;//равен пробелу,переходим к метке m3
    inc bx      ;//перешли к след элементу строки
    cld     ;//cбросили флаг,идем слева направо
    mov al, ' ' ;//в аккумулятор записыавем пробел
    mov di, bx  ;//в di записываем bx
  repne scasb       ;//пока не встретится пробел сравниваем
    dec di ;    ;//нашли пробел,получили его смещение
    mov bx, di  ;//записали в bx текущую позицию пробела
    inc cx      ;//нужно ли здесь увеличить счетчик?!!!
    jmp m3      ;//в метку m3

m4:         ;//записываем слово начинающееся на букву 'а'в строку Rez

    mov si, bx
    mov di, dx
    cld
  n1:
    lodsb
    mov bx,di
    cmp al, ' '
    je m5       ;//если дошли до пробела, то слово закончилось,в метку m5
    stosb
    loop n1

    cmp cx,0    ;//если последнее слово начинается на 'а',то следующую метку нужно проскочить
    je exit

m5:
    stosb       ;//запишем пробел в строку rez чтобы слова были разделены 
    mov dx, di  ;//текущее смещение в bx
    dec cx      ;//уменьшили счетчик
    jmp m3

exit:
    mov dx, offset  str_ent         ;// переход на следующую строку
    mov ah, 09h
    int 21h

    mov ah, 09h  ;//вывод на экран
    lea dx, Rez
    int 21h

    mov ah, 10h
    int 16h

    mov ax, 4c00h
    int 21h
code ends
end start

.data
