datasg    SEGMENT BYTE 'veri'
m  dw 8191
a dw 884
c dw 1
randomnumber db 0
datasg    ENDS
stacksg    SEGMENT BYTE STACK 'yigin'
DW 12 DUP(?)
stacksg    ENDS
codesg    SEGMENT PARA 'kod'
ASSUME CS:codesg, DS:datasg, SS:stacksg
ANA        PROC FAR
PUSH DS                ; geri donus adreslerinin ayarlanmasi
XOR AX, AX
PUSH AX
MOV AX, datasg        ; data segment degerinin ayarlanmasi
MOV DS, AX       
                 
mov si,23
mov dx,cs:[si] 
label:
mov ax,dx
xor dx,dx
mul a
add ax,c
div m      
cmp dx,255
ja label  
mov randomnumber,dl
SON:    RETF
ANA        ENDP
codesg    ENDS
END ANA
