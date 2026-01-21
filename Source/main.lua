-- Figma design to Playdate
-- Frame: 400x240 (matches Playdate screen)

import "CoreLibs/graphics"

local gfx <const> = playdate.graphics

-- 50%グレーのディザリングパターン（チェッカーボード）
local grayPattern = {0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55}

-- Figmaデザインから取得した要素

-- Ellipse 1 (黒い円): x=162, y=82, width=76, height=76
local circle1X <const> = 162 + 38  -- 中心X = 200
local circle1Y <const> = 82 + 38   -- 中心Y = 120
local circle1Radius <const> = 38

-- Ellipse 2 (グレーの円): x=200, y=82, width=76, height=76
local circle2X <const> = 200 + 38  -- 中心X = 238
local circle2Y <const> = 82 + 38   -- 中心Y = 120
local circle2Radius <const> = 38

-- Rectangle 2 (グレーバー): x=26, y=24, width=30, height=194
local barX <const> = 26
local barY <const> = 24
local barWidth <const> = 30
local barHeight <const> = 194

-- 枠線（4つの矩形で構成）
-- Rectangle 3 (左): x=11, y=15, width=15, height=210
local frameLeftX <const> = 11
local frameLeftY <const> = 15
local frameLeftWidth <const> = 15
local frameLeftHeight <const> = 210

-- Rectangle 4 (右): x=371, y=15, width=15, height=210
local frameRightX <const> = 371
local frameRightY <const> = 15
local frameRightWidth <const> = 15
local frameRightHeight <const> = 210

-- Rectangle 5 (上): x=26, y=15, width=345, height=9
local frameTopX <const> = 26
local frameTopY <const> = 15
local frameTopWidth <const> = 345
local frameTopHeight <const> = 9

-- Rectangle 6 (下): x=26, y=216, width=345, height=9
local frameBottomX <const> = 26
local frameBottomY <const> = 216
local frameBottomWidth <const> = 345
local frameBottomHeight <const> = 9

function playdate.update()
    -- 画面をクリア（白背景）
    gfx.clear(gfx.kColorWhite)

    -- 1. 枠線（4つの黒い矩形）
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRect(frameLeftX, frameLeftY, frameLeftWidth, frameLeftHeight)      -- 左
    gfx.fillRect(frameRightX, frameRightY, frameRightWidth, frameRightHeight)  -- 右
    gfx.fillRect(frameTopX, frameTopY, frameTopWidth, frameTopHeight)          -- 上
    gfx.fillRect(frameBottomX, frameBottomY, frameBottomWidth, frameBottomHeight) -- 下

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
