extends Inventory

class_name Turns

static var MAX_ROUNDS = 1 #seasons
static var MAX_TURNS = 3

static var MAX_ACTIONS = 3

#initial counters
static var curRound = 0 
static var curTurn = 0
static var action = 0

static func IncrementAction():
	action = action + 1
	print(action)
	if action == MAX_ACTIONS: IncrementTurn()

static func IncrementTurn():
			curTurn = curTurn + 1
			PopulateInventory()
			print(curTurn)
			
			if curTurn == MAX_TURNS:
				curRound = curRound + 1
				print(curRound)
