.model small
.stack 100h
.data
    player_x db 40    ; Vi tri x cua nguoi choi
    player_y db 12    ; Vi tri y cua nguoi choi 
    old_player_x db 40; Vi tri x cu cua nguoi choi
    old_player_y db 12; Vi tri y cu cua nguoi choi
    balloon_x db 20   ; Vi tri x cua bong bay
    balloon_y db 10   ; Vi tri y cua bong bay
    score db 0        ; Diem so
    msg db 'Diem: $' ; Thong bao diem
    final_msg db 13,10,'Diem cuoi cung: $' ; Thong bao diem cuoi
    continue_msg db 13,10,'Bam T de tiep tuc hoac ESC de thoat$'
    
    ; Huong dan choi
    guide1 db '=== HUONG DAN CHOI ===$'
    guide2 db 13,10,'Su dung phim mui ten de di chuyen nhan vat *$'
    guide3 db 13,10,'Thu thap cac bong bay O de ghi diem$'
    guide4 db 13,10,'Nhan Q hoac ESC de thoat tro choi$'
    guide5 db 13,10,'Nhan phim bat ki de bat dau...$'
    guide6 db 13,10,'$'

.code
display_score proc
    mov ah, 2
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 2
    mov dl, score
    add dl, 30h
    int 21h
    ret
display_score endp

display_guide proc
    mov ah, 0    ; Chuyen ve che do text
    mov al, 3
    int 10h
    
    mov ah, 9    ; Hien thi huong dan
    lea dx, guide1
    int 21h
    lea dx, guide2 
    int 21h
    lea dx, guide3
    int 21h
    lea dx, guide4
    int 21h
    lea dx, guide5
    int 21h
    lea dx, guide6
    int 21h
    
    mov ah, 0    ; Cho nhan phim bat ki
    int 16h
    
    mov ax, 0003h ; Xoa man hinh
    int 10h
    ret
display_guide endp

display_final_score proc
    mov ah, 0        ; Chuyen ve che do text
    mov al, 3
    int 10h
    
    mov ah, 9        ; Hien thi thong bao diem cuoi
    lea dx, final_msg
    int 21h
    
    mov ah, 2        ; Hien thi so diem
    mov dl, score
    add dl, 30h
    int 21h
    
    mov ah, 2        ; Xuong dong moi
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    ; Them thong bao lua chon
    mov ah, 9
    lea dx, continue_msg
    int 21h
    
wait_key:    
    mov ah, 0        ; Doi phim
    int 16h
    
    cmp al, 't'      ; Neu bam t
    je restart_game
    cmp al, 'T'      ; Neu bam T
    je restart_game
    cmp al, 27       ; Neu bam ESC
    je exit_prog
    jmp wait_key     ; Neu khong phai T hoac ESC, tiep tuc doi
    
restart_game:
    mov score, 0     ; Reset diem ve 0
    ret
    
exit_prog:
    mov ax, 4c00h    ; Thoat chuong trinh
    int 21h
    
display_final_score endp

main proc
    mov ax, @data
    mov ds, ax
    
restart:    
    ; Reset vi tri nguoi choi va bong bay
    mov player_x, 40
    mov player_y, 12
    mov old_player_x, 40
    mov old_player_y, 12
    mov balloon_x, 20
    mov balloon_y, 10
    mov score, 0
    
    ; Hien thi huong dan
    call display_guide
    
    ; An con tro
    mov ah, 1
    mov ch, 2bh
    mov cl, 0bh
    int 10h
    
    ; Xoa man hinh lan dau
    mov ax, 0003h
    int 10h
    
    ; Hien thi diem ban dau
    call display_score
    
game_loop:
    ; Xoa vi tri cu cua nguoi choi
    mov ah, 2
    mov bh, 0
    mov dh, old_player_y
    mov dl, old_player_x
    int 10h
    
    mov ah, 2
    mov dl, ' '
    int 21h
    
    ; Ve nguoi choi o vi tri moi
    mov ah, 2
    mov bh, 0
    mov dh, player_y
    mov dl, player_x
    int 10h
    
    mov ah, 2
    mov dl, '*'
    int 21h
    
    ; Luu vi tri hien tai lam vi tri cu
    mov al, player_x
    mov old_player_x, al
    mov al, player_y
    mov old_player_y, al
    
    ; Ve bong bay
    mov ah, 2
    mov bh, 0
    mov dh, balloon_y
    mov dl, balloon_x
    int 10h
    
    mov ah, 2
    mov dl, 'O'
    int 21h
    
    ; Them do tre
    mov cx, 1
    mov dx, 0
    mov ah, 86h
    int 15h
    
    ; Kiem tra phim nhan
    mov ah, 1
    int 16h
    jz check_collision
    
    mov ah, 0
    int 16h
    
    ; Xu ly phim dieu huong
    cmp ah, 48h      ; Mui ten len
    je move_up
    cmp ah, 50h      ; Mui ten xuong
    je move_down
    cmp ah, 4bh      ; Mui ten trai
    je move_left
    cmp ah, 4dh      ; Mui ten phai
    je move_right
    cmp al, 'q'      ; q de thoat
    je exit_game
    cmp al, 'Q'      ; Q de thoat
    je exit_game
    cmp al, 27       ; ESC
    je exit_game
    jmp check_collision
    
move_up:
    cmp player_y, 1
    jle check_collision
    dec player_y
    jmp check_collision
    
move_down:
    cmp player_y, 24
    jge check_collision
    inc player_y
    jmp check_collision
    
move_left:
    cmp player_x, 1
    jle check_collision
    dec player_x
    jmp check_collision
    
move_right:
    cmp player_x, 79
    jge check_collision
    inc player_x
    
check_collision:
    ; Kiem tra va cham
    mov al, player_x
    mov bl, balloon_x
    cmp al, bl
    jne no_collision
    
    mov al, player_y
    mov bl, balloon_y
    cmp al, bl
    jne no_collision
    
    ; Tang diem va cap nhat hien thi
    inc score
    call display_score
    
    ; Tao vi tri ngau nhien cho bong bay
    mov ah, 0
    int 1ah
    
    mov ax, dx
    xor dx, dx
    mov cx, 70
    div cx
    add dl, 5
    mov balloon_x, dl
    
    mov ax, dx
    xor dx, dx
    mov cx, 20
    div cx
    add dl, 2
    mov balloon_y, dl
    
    ; Xoa bong bay o vi tri cu
    mov ah, 2
    mov bh, 0
    mov dh, balloon_y
    mov dl, balloon_x
    int 10h
    
    mov ah, 2
    mov dl, ' '
    int 21h
    
no_collision:
    jmp game_loop
    
exit_game:
    call display_final_score    ; Hien thi diem cuoi cung
    cmp al, 't'                ; Kiem tra neu bam T
    je restart                  ; Neu bam T thi choi lai
    cmp al, 'T'
    je restart
    
    mov ax, 4c00h              ; Neu khong thi thoat
    int 21h
main endp
end main