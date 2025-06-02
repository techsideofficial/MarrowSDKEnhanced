using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

public class MaterialWrangler : EditorWindow
{
    private enum SearchMode { Scene, ProjectFiles }
    private enum SceneSearchFilter { Material, Shader, Texture }
    private enum ProjectSearchFilter { Shader, Texture }

    private SearchMode searchMode = SearchMode.Scene;
    private SceneSearchFilter sceneSearchFilter = SceneSearchFilter.Material;
    private ProjectSearchFilter projectSearchFilter = ProjectSearchFilter.Shader;

    private Material searchMaterial;
    private Shader searchShader;
    private Texture searchTexture;

    [MenuItem("Tools/AtlasUtils/Material Wrangler")]
    public static void ShowWindow()
    {
        GetWindow<MaterialWrangler>("Material Wrangler");
    }

    private void OnGUI()
    {
        GUILayout.Label("Material Wrangler", EditorStyles.boldLabel);

        SearchMode newSearchMode = (SearchMode)EditorGUILayout.EnumPopup("Search Mode", searchMode);
        if (newSearchMode != searchMode)
        {
            searchMode = newSearchMode;
            if (searchMode == SearchMode.ProjectFiles)
            {
                projectSearchFilter = ProjectSearchFilter.Shader;
            }
            else
            {
                sceneSearchFilter = SceneSearchFilter.Material;
            }
        }

        if (searchMode == SearchMode.Scene)
        {
            sceneSearchFilter = (SceneSearchFilter)EditorGUILayout.EnumPopup("Search Filter", sceneSearchFilter);
        }
        else
        {
            projectSearchFilter = (ProjectSearchFilter)EditorGUILayout.EnumPopup("Search Filter", projectSearchFilter);
        }

        if (searchMode == SearchMode.Scene)
        {
            switch (sceneSearchFilter)
            {
                case SceneSearchFilter.Material:
                    searchMaterial = (Material)EditorGUILayout.ObjectField("Material", searchMaterial, typeof(Material), false);
                    break;

                case SceneSearchFilter.Shader:
                    searchShader = (Shader)EditorGUILayout.ObjectField("Shader", searchShader, typeof(Shader), false);
                    break;

                case SceneSearchFilter.Texture:
                    searchTexture = (Texture)EditorGUILayout.ObjectField("Texture", searchTexture, typeof(Texture), false);
                    break;
            }
        }
        else
        {
            switch (projectSearchFilter)
            {
                case ProjectSearchFilter.Shader:
                    searchShader = (Shader)EditorGUILayout.ObjectField("Shader", searchShader, typeof(Shader), false);
                    break;

                case ProjectSearchFilter.Texture:
                    searchTexture = (Texture)EditorGUILayout.ObjectField("Texture", searchTexture, typeof(Texture), false);
                    break;
            }
        }

        if (GUILayout.Button("Select Objects"))
        {
            SelectObjects();
        }
    }

    private void SelectObjects()
    {
        switch (searchMode)
        {
            case SearchMode.Scene:
                switch (sceneSearchFilter)
                {
                    case SceneSearchFilter.Material:
                        if (searchMaterial != null)
                        {
                            SelectObjectsByMaterialInScene();
                        }
                        break;

                    case SceneSearchFilter.Shader:
                        if (searchShader != null)
                        {
                            SelectObjectsByShaderInScene();
                        }
                        break;

                    case SceneSearchFilter.Texture:
                        if (searchTexture != null)
                        {
                            SelectObjectsByTextureInScene();
                        }
                        break;
                }
                break;

            case SearchMode.ProjectFiles:
                switch (projectSearchFilter)
                {
                    case ProjectSearchFilter.Shader:
                        if (searchShader != null)
                        {
                            SelectMaterialsByShaderInProject();
                        }
                        break;

                    case ProjectSearchFilter.Texture:
                        if (searchTexture != null)
                        {
                            SelectTexturesInProject();
                        }
                        break;
                }
                break;
        }
    }

    private void SelectObjectsByMaterialInScene()
    {
        List<GameObject> matchingObjects = new List<GameObject>();
        GameObject[] allObjects = FindObjectsOfType<GameObject>();
        foreach (GameObject obj in allObjects)
        {
            MeshRenderer renderer = obj.GetComponent<MeshRenderer>();
            if (renderer && renderer.sharedMaterial == searchMaterial)
            {
                matchingObjects.Add(obj);
            }
        }
        Selection.objects = matchingObjects.ToArray();
    }

    private void SelectObjectsByShaderInScene()
    {
        List<GameObject> matchingObjects = new List<GameObject>();
        GameObject[] allObjects = FindObjectsOfType<GameObject>();
        foreach (GameObject obj in allObjects)
        {
            MeshRenderer renderer = obj.GetComponent<MeshRenderer>();
            if (renderer && renderer.sharedMaterial.shader == searchShader)
            {
                matchingObjects.Add(obj);
            }
        }
        Selection.objects = matchingObjects.ToArray();
    }

    private void SelectObjectsByTextureInScene()
    {
        List<GameObject> matchingObjects = new List<GameObject>();
        GameObject[] allObjects = FindObjectsOfType<GameObject>();
        foreach (GameObject obj in allObjects)
        {
            MeshRenderer renderer = obj.GetComponent<MeshRenderer>();
            if (renderer && renderer.sharedMaterial.mainTexture == searchTexture)
            {
                matchingObjects.Add(obj);
            }
        }
        Selection.objects = matchingObjects.ToArray();
    }

    private void SelectMaterialsByShaderInProject()
    {
        List<Object> matchingMaterials = new List<Object>();
        string[] guids = AssetDatabase.FindAssets("t:Material");
        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            Material mat = AssetDatabase.LoadAssetAtPath<Material>(path);
            if (mat && mat.shader == searchShader)
            {
                matchingMaterials.Add(mat);
            }
        }
        Selection.objects = matchingMaterials.ToArray();
    }

    private void SelectTexturesInProject()
    {
        List<Object> matchingTextures = new List<Object>();
        string[] guids = AssetDatabase.FindAssets("t:Texture");
        foreach (string guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            Texture tex = AssetDatabase.LoadAssetAtPath<Texture>(path);
            if (tex == searchTexture)
            {
                matchingTextures.Add(tex);
            }
        }
        Selection.objects = matchingTextures.ToArray();
    }
}
