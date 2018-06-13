Shader "Hidden/GrayscaleScreen"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_EffectAmount ("Effect Amount", Range(0, 1)) = 1.0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _EffectAmount;
			
			fixed4 frag (v2f_img i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
				
				//col.rgb = dot(col.rgb, float3(0.299, 0.587, 0.114));
				col.rgb = lerp(col.rgb, dot(col.rgb, float3(0.299, 0.587, 0.114)), _EffectAmount);

				return col;
			}
			ENDCG
		}
	}
}
