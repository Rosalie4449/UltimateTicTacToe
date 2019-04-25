//
//  Board.swift
//  UltimateTicTacToe
//
//  Created by Zhang, Matthew on 4/17/19.
//  Copyright © 2019 friscoisd. All rights reserved.
//

import SpriteKit
import Foundation

class Board
{
    var grid: [[String]]
    var winner: String
    
    var isFull: Bool
    var numTimesPlayed: Int = 0
    
    init()
    {
        grid = [[" "," "," "],[" "," "," "],[" "," "," "]]
        winner = " "
        isFull = false
    }
    
    func play(_ player: String, at pos: CGPoint)
    {
        let x = Int(pos.x)
        let y = Int(pos.y)
        
        guard x >= 0 && x < 3 && y >= 0 && y < 3 else { return }
        guard grid[y][x] == " " else { return }
        
        grid[y][x] = player
        
        // check for winner
        var col = 0;
        while (col < 3) {
            if (grid[col][x] != player) {
                break
            }
            col += 1
            
            if (col == 3) {
                setWinner(to: player)
            }
        }
        
        var row = 0;
        while (row < 3) {
            if (grid[y][row] != player) {
                break
            }
            row += 1
            
            if (row == 3) {
                setWinner(to: player)
            }
        }
        
        if (y == x) {
            row = 0;
            while (row < 3) {
                if (grid[row][row] != player) {
                    break
                }
                row += 1
                
                if (row == 3) {
                    setWinner(to: player)
                }
            }
        }
        
        if (y == 2 - x) {
            row = 0;
            while (row < 3) {
                if (grid[row][2 - row] != player) {
                    break
                }
                row += 1
                
                if (row == 3) {
                    setWinner(to: player)
                }
            }
        }
        
        
        numTimesPlayed += 1
        if (numTimesPlayed == 9) {
            isFull = true
        }
        
        
    }
    
    func setWinner(to player: String) {
        winner = player
    }
    
}