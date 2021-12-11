function createAfterChars() {
    // PlayState.boyfriend.x += 200;
    // PlayState.boyfriend.y += 220;
    // PlayState.gf.x += 180;
    // PlayState.gf.y += 300;
}

function create() {
    // defaultCamZoom = 0.9;
    gfVersion = "gf-pixel";

    var bgSky = new FlxSprite().loadGraphic(Paths.image('weeb/weebSky'));
    bgSky.scrollFactor.set(0.1, 0.1);
    PlayState.add(bgSky);

    var repositionShit = -200;

    var bgSchool:FlxSprite = new FlxSprite(repositionShit, 0).loadGraphic(Paths.image('weeb/weebSchool'));
    bgSchool.scrollFactor.set(0.6, 0.90);
    PlayState.add(bgSchool);

    var bgStreet:FlxSprite = new FlxSprite(repositionShit).loadGraphic(Paths.image('weeb/weebStreet'));
    bgStreet.scrollFactor.set(0.95, 0.95);
    PlayState.add(bgStreet);

    var fgTrees:FlxSprite = new FlxSprite(repositionShit + 170, 130).loadGraphic(Paths.image('weeb/weebTreesBack'));
    fgTrees.scrollFactor.set(0.9, 0.9);
    PlayState.add(fgTrees);

    var bgTrees:FlxSprite = new FlxSprite(repositionShit - 380, -800);
    var treetex = Paths.getPackerAtlas('weeb/weebTrees');
    bgTrees.frames = treetex;
    bgTrees.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
    bgTrees.animation.play('treeLoop');
    bgTrees.scrollFactor.set(0.85, 0.85);
    PlayState.add(bgTrees);

    var treeLeaves:FlxSprite = new FlxSprite(repositionShit, -40);
    treeLeaves.frames = Paths.getSparrowAtlas('weeb/petals');
    treeLeaves.animation.addByPrefix('leaves', 'PETALS ALL', 24, true);
    treeLeaves.animation.play('leaves');
    treeLeaves.scrollFactor.set(0.85, 0.85);
    PlayState.add(treeLeaves);

    var widShit = Std.int(bgSky.width * 6);

    bgSky.setGraphicSize(widShit);
    bgSchool.setGraphicSize(widShit);
    bgStreet.setGraphicSize(widShit);
    bgTrees.setGraphicSize(Std.int(widShit * 1.4));
    fgTrees.setGraphicSize(Std.int(widShit * 0.8));
    treeLeaves.setGraphicSize(widShit);

    fgTrees.updateHitbox();
    bgSky.updateHitbox();
    bgSchool.updateHitbox();
    bgStreet.updateHitbox();
    bgTrees.updateHitbox();
    treeLeaves.updateHitbox();

    bgGirls = new FlxSprite(-100, 190);
    bgGirls.frames = Paths.getSparrowAtlas('weeb/bgFreaks');
    if (PlayState_.SONG.song.toLowerCase() == 'roses')
    {
        bgGirls.animation.addByIndices('danceLeft', 'BG fangirls dissuaded', CoolUtil.numberArray(14), "", 24, false);
        bgGirls.animation.addByIndices('danceRight', 'BG fangirls dissuaded', CoolUtil.numberArray(14), "", 24, false);
    } else {
        bgGirls.animation.addByIndices('danceLeft', 'BG girls group', CoolUtil.numberArray(14), "", 24, false);
        bgGirls.animation.addByIndices('danceRight', 'BG girls group', CoolUtil.numberArray(14), "", 24, false);
    }
    bgGirls.scrollFactor.set(0.9, 0.9);

    bgGirls.setGraphicSize(Std.int(bgGirls.width * PlayState_.daPixelZoom));
    bgGirls.updateHitbox();
    
    bgGirls.animation.play('danceLeft');
    PlayState.add(bgGirls);
}


function beatHit(curBeat)
{
    if (curBeat % 2 == 0)
        bgGirls.animation.play('danceRight', true);
    else
        bgGirls.animation.play('danceLeft', true);
}