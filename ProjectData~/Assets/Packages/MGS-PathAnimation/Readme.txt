﻿==========================================================================
  Copyright © 2017-2018 Mogoson. All rights reserved.
  Name: MGS-PathAnimation
  Author: Mogoson   Version: 0.1.2   Date: 6/24/2018
==========================================================================
  [Summary]
    Unity plugin for make path animation in scene.
--------------------------------------------------------------------------
  [Demand]
    Create path base on anchor curve and play animation base on path.
--------------------------------------------------------------------------
  [Environment]
    Unity 5.0 or above.
    .Net Framework 3.0 or above.
--------------------------------------------------------------------------
  [Achieve]
    BezierCurve : Define BezierCurve.
    HermiteCurve : Hermite curve in three dimensional space.
    EllipseCurve : Ellipse curve.
    HelixCurve : Helix curve.
    SinCurve : Sin curve.

    CurvePath : Define path base on curve.
    BezierPath : Define path base on cubic bezier curve.
    HermitePath :  Define curve path base on hermite curve.
    CirclePath : Path base on circle curve.
    EllipsePath : Path base on ellipse curve.
    HelixPath : Path base on helix curve.
    SinPath : Path base on sin curve.

    CurvePathAnimation : Define animation base on curve path.

    GenericEditor : Define generic editor.
    CurvePathEditor : Editor for CurvePath.
    BezierPathEditor : Editor for BezierPath.
    HermitePathEditor : Editor for HermitePath.
    CurvePathAnimationEditor : Editor for CurvePathAnimation.
--------------------------------------------------------------------------
  [Usage]
    Create an empty gameobject and attach the path component BezierPath
    or HermitePath to it.

    If BezierPath attached, drag the green sphere to change tangent and
    drag the blue sphere to change it's position.

    if HermitePath attached, drag the blue sphere to change it's position,
    press the ALT key and click the green sphere to add anchor, press the
    SHIFT key and click the red sphere to remove anchor if you want.
    
    Attach the CurvePathAnimation component to the target animation
    gameobject, set the "Path" as the path component and click the
    "Align To Path" button to align the animation gameobject to the start
    point of path curve.
--------------------------------------------------------------------------
  [Demo]
    Demos in the path "MGS-PathAnimation/Scenes" provide reference to you.
--------------------------------------------------------------------------
  [Resource]
    https://github.com/mogoson/MGS-PathAnimation.
--------------------------------------------------------------------------
  [Contact]
    If you have any questions, feel free to contact me at mogoson@outlook.com.
--------------------------------------------------------------------------