Route15Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route15Gate2F_TextPointers:
	dw Route15GateUpstairsText1
	dw Route15GateUpstairsText2

Route15GateUpstairsText1:
	text_asm
	CheckEvent EVENT_GOT_EXP_ALL
	jr nz, .asm_49683
	ld a, 50 ; pokemon needed
	ldh [hOaksAideRequirement], a
	ld a, EXP_ALL ; oak's aide reward
	ldh [hOaksAideRewardItem], a
	ld [wd11e], a
	call GetItemName
	ld hl, wcd6d
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	call CopyData
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	cp $1
	jr nz, .asm_49689
	SetEvent EVENT_GOT_EXP_ALL
.asm_49683
	ld hl, Route15GateUpstairsText_4968c
	call PrintText
.asm_49689
	jp TextScriptEnd

Route15GateUpstairsText_4968c:
	text_far _Route15GateUpstairsText_4968c
	text_end

Route15GateUpstairsText2:
	text_asm
	ld hl, Route15GateUpstairsText_49698
	jp GateUpstairsScript_PrintIfFacingUp

Route15GateUpstairsText_49698:
	text_far _Route15GateUpstairsText_49698
	text_end
