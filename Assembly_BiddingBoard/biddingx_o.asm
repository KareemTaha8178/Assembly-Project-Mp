

org  100h	; set location counter to 100h

.data
  msg1 DB 'player no 1 enter a number to bid on', '$'
  msg2 DB  'player no 2 enter a number to bid on', '$'
  msg3 DB  'bidding numbers are equal please re enter the numbers','$'
 string db 5 ;MAX NUMBER OF CHARACTERS ALLOWED (4).
       db ? ;NUMBER OF CHARACTERS ENTERED BY USER.
       db 5 dup (?) ;CHARACTERS ENTERED BY USER. 

player_bidding DB ?



.code 
   
   
  
   
 main proc


        
     call bidding_board
      
    Exit:       ;Mark exit of code segment
    MOV AH, 4CH ;4CH = DOS exit fuction. Handover the control to OS and exit program
    INT 21H    
           
      main endp 
     
  
    ;newline function  
    newline proc   
        
        mov ah, 02h
        mov dl, 13
        int 21h
        mov dl, 10
        int 21h 
    
    ret   
    newline endp  
     
    ;************************func to convert string to integer value ***************************
     
    ;CONVERT STRING TO NUMBER IN BX.
    proc string2number         
        ;MAKE SI TO POINT TO THE LEAST SIGNIFICANT DIGIT.
          mov  si, offset string + 1 ;
          mov  cl, [ si ]                                        
          mov  ch, 0 
          add  si, cx 
        ;CONVERT STRING.
          mov  bx, 0
          mov  bp, 1 ;MULTIPLE OF 10 TO MULTIPLY EVERY DIGIT.
        repeat:         
        ;CONVERT CHARACTER.                    
          mov  al, [ si ] ;CHARACTER TO PROCESS.
          sub  al, 48 
          mov  ah, 0 ;
          mul  bp ;AX*BP = DX:AX.
          add  bx,ax          
          mov  ax, bp
          mov  bp, 10
          mul  bp 
          mov  bp, ax  
        ;CHECK IF WE HAVE FINISHED.
          dec  si 
          loop repeat 
        
      ret 
    string2number endp  
    
   
    ;bidding function
    
    bidding_board proc  
         label1:    
         call newline  
         MOV AX,@DATA 
         MOV DS,AX 
         
         ; load address of the string1
         LEA DX,msg1
         
         ;output the string
         ;loaded in dx 
         MOV AH,09H
         INT 21H 
         ;call function to print new line between the strings   
         call newline   
         
         
         
         ;*********************** new code ******************************************* 
         
                  ;------------------------------------------
        ;CAPTURE CHARACTERS (THE NUMBER).
          mov  ah, 0Ah
          mov  dx, offset string
          int  21h
        ;------------------------------------------
          call string2number
          mov di,BX       
          cmp di,101 ; si contain the first player bid number
          JGE label1  
          jmp label2  
             
             
         ;*************** ask the second user for bidding number *****************
         
             
         label2:       
         ; display the second message for the user 
         call newline
           
         MOV AX,@DATA 
         MOV DS,AX 
                   
         ; load address of the string1
         LEA DX,msg2
          
         ;output the string
         ;loaded in dx 
         MOV AH,09H
         INT 21H 
         ;call function to print new line between the strings   
         call newline   
            
          ;CAPTURE CHARACTERS (THE NUMBER).
          mov  ah, 0Ah
          mov  dx, offset string
          int  21h
        ;------------------------------------------
          call string2number
          call newline      
          cmp BX,101 ; Dx contain the second player bid number
          JGE label2  
          jmp check_label 
          
         
       ;***************** check who has the right to play ****************** if else statement***********
         ;Di =bid_player1 BX=bid_player2 
         check_label:
         mov AX,0 ;player1_count
         mov dx,0 ;player2_count
          
         cmp Di,BX 
         JG check_label2 
         JL check_label3
         
         ; load address of the msg3
         LEA DX,msg3
         
         ;output the string
         ;loaded in dx 
         MOV AH,09H
         INT 21H 
        
         Jmp label1
         
          
        check_label2: ;si>di
        sub AX,di
        add AX,di 
        mov player_bidding,1
        ;here we need to call board function to play   
        
         
        check_label3:
        sub dx,BX
        add AX,BX  
        mov player_bidding,2  
        ;here we need to call board function to play   
        

       

 
      ret 
      
     bidding_board endp
    
    
    
     
  end main
            
 
            
         
ret   ; return to the operating system.

























