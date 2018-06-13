Shader "Wrathlust/ScanlinesScreen"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_MaskTex ("Mask", 2D) = "white" {}
		_MaskBlend ("Mask Blending", Range(0, 1)) = 0.5
		_MaskSize ("Mask Size", Float) = 1
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			sampler2D _MaskTex;
			float4 _MaskTex_ST;

			fixed _MaskBlend;
			fixed _MaskSize;
			
			fixed4 frag (v2f_img i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);

				fixed4 mask = tex2D(_MaskTex, i.uv * _MaskTex_ST.xy);
				
				col = lerp(col, mask, _MaskBlend);

				return col;
			}
			ENDCG
		}
	}
}
