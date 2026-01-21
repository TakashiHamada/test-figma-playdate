-- Figma design to Playdate
-- Frame: 400x240 (matches Playdate screen)

import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

-- 50%グレーのディザリングパターン（チェッカーボード）
local grayPattern = {0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55}

-- Figmaデザインから取得した要素

-- Ellipse 1 (黒い円): x=149, y=159, width=76, height=76
local circle1X <const> = 149 + 38  -- 中心X
local circle1Y <const> = 159 + 38  -- 中心Y
local circle1Radius <const> = 38

-- Ellipse 2 (グレーの円): x=187, y=159, width=76, height=76
local circle2X <const> = 187 + 38  -- 中心X
local circle2Y <const> = 159 + 38  -- 中心Y
local circle2Radius <const> = 38

-- Rectangle 2 (グレーバー): x=26, y=24, width=30, height=194
local barX <const> = 26
local barY <const> = 24
local barWidth <const> = 30
local barHeight <const> = 194

-- 枠線（4つの矩形で構成）
local frameLeftX <const> = 11
local frameLeftY <const> = 15
local frameLeftWidth <const> = 15
local frameLeftHeight <const> = 210

local frameRightX <const> = 371
local frameRightY <const> = 15
local frameRightWidth <const> = 15
local frameRightHeight <const> = 210

local frameTopX <const> = 26
local frameTopY <const> = 15
local frameTopWidth <const> = 345
local frameTopHeight <const> = 9

local frameBottomX <const> = 26
local frameBottomY <const> = 216
local frameBottomWidth <const> = 345
local frameBottomHeight <const> = 9

-- カーソルターゲット（tag_cursor_targets）
-- ロケーターの位置（中心座標）
local cursorTargets = {
    {x = 123 + 6, y = 70 + 6},  -- 0
    {x = 194 + 6, y = 70 + 6},  -- 1
    {x = 265 + 6, y = 70 + 6},  -- 2
}

-- カーソルの状態
local currentTargetIndex = 1  -- 現在のターゲットインデックス（1始まり）
local cursorSize <const> = 73
local cursorCornerLength <const> = 15
local cursorCornerWidth <const> = 5

-- カーソルを描画する関数（角かっこスタイル）
function drawCursor(centerX, centerY)
    local halfSize = cursorSize / 2
    local left = centerX - halfSize
    local top = centerY - halfSize
    local right = centerX + halfSize
    local bottom = centerY + halfSize

    gfx.setColor(gfx.kColorBlack)

    -- 左上の角
    gfx.fillRect(left, top, cursorCornerLength, cursorCornerWidth)  -- 横
    gfx.fillRect(left, top, cursorCornerWidth, cursorCornerLength)  -- 縦

    -- 右上の角
    gfx.fillRect(right - cursorCornerLength, top, cursorCornerLength, cursorCornerWidth)  -- 横
    gfx.fillRect(right - cursorCornerWidth, top, cursorCornerWidth, cursorCornerLength)   -- 縦

    -- 左下の角
    gfx.fillRect(left, bottom - cursorCornerWidth, cursorCornerLength, cursorCornerWidth)  -- 横
    gfx.fillRect(left, bottom - cursorCornerLength, cursorCornerWidth, cursorCornerLength) -- 縦

    -- 右下の角
    gfx.fillRect(right - cursorCornerLength, bottom - cursorCornerWidth, cursorCornerLength, cursorCornerWidth)  -- 横
    gfx.fillRect(right - cursorCornerWidth, bottom - cursorCornerLength, cursorCornerWidth, cursorCornerLength)  -- 縦
end

-- 背景を描画する関数
function drawBackground()
    -- 画面をクリア（白背景）
    gfx.clear(gfx.kColorWhite)

    -- 1. 枠線（4つの黒い矩形）
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRect(frameLeftX, frameLeftY, frameLeftWidth, frameLeftHeight)
    gfx.fillRect(frameRightX, frameRightY, frameRightWidth, frameRightHeight)
    gfx.fillRect(frameTopX, frameTopY, frameTopWidth, frameTopHeight)
    gfx.fillRect(frameBottomX, frameBottomY, frameBottomWidth, frameBottomHeight)

    -- 2. グレーの縦バー（ディザリングパターン）
    gfx.setPattern(grayPattern)
    gfx.fillRect(barX, barY, barWidth, barHeight)

    -- 3. 黒い円
    gfx.setColor(gfx.kColorBlack)
    gfx.fillCircleAtPoint(circle1X, circle1Y, circle1Radius)

    -- 4. グレーの円（ディザリングパターン）
    gfx.setPattern(grayPattern)
    gfx.fillCircleAtPoint(circle2X, circle2Y, circle2Radius)
end

-- 入力処理
function playdate.leftButtonDown()
    currentTargetIndex = currentTargetIndex - 1
    if currentTargetIndex < 1 then
        currentTargetIndex = #cursorTargets  -- 最後に戻る
    end
end

function playdate.rightButtonDown()
    currentTargetIndex = currentTargetIndex + 1
    if currentTargetIndex > #cursorTargets then
        currentTargetIndex = 1  -- 最初に戻る
    end
end

function playdate.update()
    -- 背景を描画
    drawBackground()

    -- カーソルを現在のターゲット位置に描画
    local target = cursorTargets[currentTargetIndex]
    drawCursor(target.x, target.y)
end
