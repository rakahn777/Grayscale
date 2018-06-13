using UnityEngine;

[ExecuteInEditMode]
public class ScreenGrayscale : MonoBehaviour
{
    public float intensity;
    private Material mat;

    // Use this for initialization
    void Awake()
    {
        mat = new Material(Shader.Find("Hidden/GrayscaleScreen"));
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (intensity == 0)
        {
            Graphics.Blit(source, destination);
        }
        else
        {
            mat.SetFloat("_EffectAmount", intensity);
            Graphics.Blit(source, destination, mat);
        }
    }
}
