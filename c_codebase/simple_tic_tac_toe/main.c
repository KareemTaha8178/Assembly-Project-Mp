#include <stdio.h>
#include <cstdlib>
// this is not there for linux
#include <conio.h>
#include "board_drawer.h"
#include "shared.h"
#include "check_board_state.h"

// will use curses.h alternative
// #include <curses.h>

//char square[10] = {'o', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

//void drawBoard(square);

int main()
{
    int player = 1, i, choice;

    char mark;
    do
    {
        drawBoard(square);
        player = (player % 2) ? 1 : 2;

        printf("Player %d, enter a number:  ", player);
        scanf("%d", &choice);

        mark = (player == 1) ? 'X' : 'O';

        if (choice == 1 && square[1] == '1')
            square[1] = mark;

        else if (choice == 2 && square[2] == '2')
            square[2] = mark;

        else if (choice == 3 && square[3] == '3')
            square[3] = mark;

        else if (choice == 4 && square[4] == '4')
            square[4] = mark;

        else if (choice == 5 && square[5] == '5')
            square[5] = mark;

        else if (choice == 6 && square[6] == '6')
            square[6] = mark;

        else if (choice == 7 && square[7] == '7')
            square[7] = mark;

        else if (choice == 8 && square[8] == '8')
            square[8] = mark;

        else if (choice == 9 && square[9] == '9')
            square[9] = mark;

        else
        {
            printf("Invalid move ");

            player--;
            getch();
        }
        i = checkBoardState(square);

        player++;
    } while (i == -1);

    drawBoard(square);

    if (i == 1)
        printf("==>\aPlayer %d win ", --player);
    else
        printf("==>\aGame draw");

    getch();

    return 0;
}

/*********************************************

FUNCTION TO RETURN GAME STATUS
1 FOR GAME IS OVER WITH RESULT
-1 FOR GAME IS IN PROGRESS
O GAME IS OVER AND NO RESULT
 **********************************************/

//int checkBoardState(square)//outsourced to the other file
//{
//    if (square[1] == square[2] && square[2] == square[3])
//        return 1;
//
//    else if (square[4] == square[5] && square[5] == square[6])
//        return 1;
//
//    else if (square[7] == square[8] && square[8] == square[9])
//        return 1;
//
//    else if (square[1] == square[4] && square[4] == square[7])
//        return 1;
//
//    else if (square[2] == square[5] && square[5] == square[8])
//        return 1;
//
//    else if (square[3] == square[6] && square[6] == square[9])
//        return 1;
//
//    else if (square[1] == square[5] && square[5] == square[9])
//        return 1;
//
//    else if (square[3] == square[5] && square[5] == square[7])
//        return 1;
//
//    else if (square[1] != '1' && square[2] != '2' && square[3] != '3' &&
//             square[4] != '4' && square[5] != '5' && square[6] != '6' && square[7] != '7' && square[8] != '8' && square[9] != '9')
//
//        return 0;
//    else
//        return -1;
//}

/*******************************************************************
FUNCTION TO DRAW BOARD OF TIC TAC TOE WITH PLAYERS MARK
 ********************************************************************/

//void drawBoard(square)
//{
//    system("clear"); // for linux it's clear not clr
//    printf("\n\n\tTic Tac Toe\n\n");
//
//    printf("Player 1 (X)  -  Player 2 (O)\n\n\n");
//
//    printf("     |     |     \n");
//    printf("  %c  |  %c  |  %c \n", square[1], square[2], square[3]);
//
//    printf("_____|_____|_____\n");
//    printf("     |     |     \n");
//
//    printf("  %c  |  %c  |  %c \n", square[4], square[5], square[6]);
//
//    printf("_____|_____|_____\n");
//    printf("     |     |     \n");
//
//    printf("  %c  |  %c  |  %c \n", square[7], square[8], square[9]);
//
//    printf("     |     |     \n\n");
//}

/*******************************************************************
END OF PROJECT
 ********************************************************************/
