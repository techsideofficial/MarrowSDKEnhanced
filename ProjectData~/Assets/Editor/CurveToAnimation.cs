using UnityEngine;
using UnityEditor;
using BezierSolution;

public class CurveToAnimationEditor : EditorWindow
{
    private BezierSpline bezierSpline; // Reference to the BezierSpline
    private Transform animatedObject;  // The object to animate
    private float duration = 5.0f;     // Duration of the animation

    [MenuItem("Tools/Curve to Animation Clip")]
    public static void ShowWindow()
    {
        GetWindow<CurveToAnimationEditor>("Curve to Animation Clip");
    }

    private void OnGUI()
    {
        GUILayout.Label("Generate Animation from Bezier Curve", EditorStyles.boldLabel);

        // Assign the BezierSpline and object to animate in the UI
        bezierSpline = (BezierSpline)EditorGUILayout.ObjectField("Bezier Spline", bezierSpline, typeof(BezierSpline), true);
        animatedObject = (Transform)EditorGUILayout.ObjectField("Animated Object", animatedObject, typeof(Transform), true);
        duration = EditorGUILayout.FloatField("Duration", duration);

        if (GUILayout.Button("Create Animation Clip"))
        {
            CreateAnimationClip();
        }
    }

    private void CreateAnimationClip()
    {
        if (bezierSpline == null || animatedObject == null)
        {
            Debug.LogError("Bezier Spline and Animated Object are required.");
            return;
        }

        // Create a new AnimationClip
        AnimationClip animClip = new AnimationClip { frameRate = 30 };

        // AnimationCurves for X, Y, and Z positions
        AnimationCurve curveX = new AnimationCurve();
        AnimationCurve curveY = new AnimationCurve();
        AnimationCurve curveZ = new AnimationCurve();

        int samplePoints = 100;

        for (int i = 0; i <= samplePoints; i++)
        {
            float t = i / (float)samplePoints;
            Vector3 position = bezierSpline.GetPoint(t); // Get point on the Bezier spline

            float time = t * duration;
            curveX.AddKey(new Keyframe(time, position.x));
            curveY.AddKey(new Keyframe(time, position.y));
            curveZ.AddKey(new Keyframe(time, position.z));
        }

        // Assign the curves to the AnimationClip
        animClip.SetCurve("", typeof(Transform), "localPosition.x", curveX);
        animClip.SetCurve("", typeof(Transform), "localPosition.y", curveY);
        animClip.SetCurve("", typeof(Transform), "localPosition.z", curveZ);

        // Save the AnimationClip in the Assets folder
        string path = "Assets/GeneratedBezierAnimation.anim";
        AssetDatabase.CreateAsset(animClip, path);
        AssetDatabase.SaveAssets();

        Debug.Log($"Animation clip created at {path}");
    }
}
