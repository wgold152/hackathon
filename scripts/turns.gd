extends Node
class_name Turns

var ROUNDS = 4 #seasons
var MAX_TURNS = 3

var MAX_ACTIONS = 5

#initial counters
#start at round 0 for tutorial
static var curRound = 0 
static var curTurn = 0
static var action = 0

func incrementTurn():
		if action == MAX_ACTIONS: curTurn + 1
	
func incrementRound():
	if curTurn == MAX_TURNS: curRound + 1
