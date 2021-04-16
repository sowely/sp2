.386
.model flat, stdcall, C
option casemap: none
 
include c:/masm32/include/windows.inc
include c:/masm32/include/user32.inc
include c:/masm32/include/kernel32.inc
includelib c:/masm32/lib/user32.lib
includelib c:/masm32/lib/kernel32.lib

include c:/masm32/include/msvcrt.inc
includelib c:/masm32/lib/msvcrt.lib

.data
    Array db 99, 10, 34, 9, 32, 12, 99, 221, 3, 78
    n = $-Array                             
    sumzero db 0   
    format db "%d", 0    
    buff db 16 dup (?)                       
    szCaption db 'masm', 0                                             
.code
start:
	mov ebx, 0      ; [i]
	
	_next_iter:
        cmp ebx, n  ; [i]==n?
        je _close
        xor eax, eax
        mov al, [Array+ebx]
        test al,00100010b
        JZ zero
        inc ebx
        jmp _next_iter
        
    zero:
    	inc ebx
       	inc sumzero       	
       	jmp _next_iter
               
    _close:
     	;result
       	invoke wsprintfA, addr buff, addr format, sumzero           
       	invoke MessageBox, NULL,addr buff, offset szCaption, MB_OK        
end start