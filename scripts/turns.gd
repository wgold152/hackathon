extends Inventory

class_name Turns

var MAX_ROUNDS = 1 #seasons
var MAX_TURNS = 3

var MAX_ACTIONS = 3

#initial counters
#start at round 0 for tutorial
static var curRound = 0 
static var curTurn = 0
static var action = 0

#func IncrementTurn():
			#curTurn + 1
			#PopulateInventory()
			#
			#if curTurn == MAX_TURNS:
				#curRound + 1
				#
				#if curRound == MAX_ROUNDS: Reset()
			#
