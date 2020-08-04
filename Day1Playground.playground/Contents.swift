import SwiftUI

let rightAnswers = [(0, 0, 1), (0, 1, 2), (1, 0, 2), (1, 1, 0), (2, 0, 0), (2, 1, 1)]

func isRightAnswer(_ appCurrentChoice: Int, _ appCurrentWinLose: Int, _ usersChoice: Int) -> Bool{
    if containsTupple(rightAnswers, (appCurrentChoice, appCurrentWinLose, usersChoice)){
        return true
    }
    else{
        return false
    }
}

func containsTupple(_ a:[(Int, Int, Int)], _ v:(Int,Int, Int)) -> Bool {
  let (c1, c2, c3) = v
  for (v1, v2, v3) in a { if v1 == c1 && v2 == c2 && v3 == c3{ return true } }
  return false
}

isRightAnswer(0, 0, 2)

