extends Control

func updatee(selected_level):
	visible = true
	match selected_level:
		"infinite":
			$Level.text = "Infinite"
			$Goal.text = "Goal: Survive as long as possible\nBest score: " + str(global.best_score)
			$Completed.visible = false
		
		"level_1":
			$Level.text = "Level 1 (Beginning)"
			$Goal.text = "Goal: kill all 10 enemies"
			
			if global.meaning_levels[0] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_2":
			$Level.text = "Level 2"
			$Goal.text = "Goal: live for 20 seconds"
			
			if global.meaning_levels[1] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_3":
			$Level.text = "Level 3 (Pacifist)"
			$Goal.text = "Goal: don't kill anyone for 20 seconds"
			
			if global.meaning_levels[2] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_4":
			$Level.text = "Level 4"
			$Goal.text = "Goal: drive 10000 pixels"
			
			if global.meaning_levels[3] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_5":
			$Level.text = "Level 5"
			$Goal.text = "Goal: kill all 40 enemies"
			
			if global.meaning_levels[4] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_6":
			$Level.text = "Level 6"
			$Goal.text = "Goal: live for 45 seconds"
			
			if global.meaning_levels[5] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_7":
			$Level.text = "Level 7 (Suicide?)"
			$Goal.text = "Goal: kill all 35 enemies"
			
			if global.meaning_levels[6] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_8":
			$Level.text = "Level 8"
			$Goal.text = "Goal: live for 40 seconds"
			
			if global.meaning_levels[7] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
			
		"level_9":
			$Level.text = "Level 9 (End?)"
			$Goal.text = "Goal: kill all 50 enemies"
			
			if global.meaning_levels[8] == "1":
				$Completed.visible = true
			else:
				$Completed.visible = false
