// Made with Amplify Shader Editor v1.9.1.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
// Force reimport: 2
Shader "LitMAS Water 2.0"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(Textures)][NoScaleOffset][Normal]_BumpMap("Normal", 2D) = "bump" {}
		[Header((Non MV ONLY))]_NormalIntensity("Normal Intensity", Range( 0 , 10)) = 0.6
		[Header((Non MV ONLY 0.1 Through 1 Recommended))]_NormalTiling("Normal Tiling", Vector) = (0.2,0.2,0,0)
		[Header(Water Attributes)]_WaterSmoothness("Water Smoothness", Range( 0 , 1)) = 0.8
		_DistortionIntensity("Distortion Intensity", Range( 0 , 0.7)) = 0.1
		[HDR]_WaterColor("Water Color", Color) = (0.1333333,0.1333333,0.1333333,1)
		[HDR][Header(Depth Color Blending)]_DeepColor("Deep Color", Color) = (0.01960784,0.003921569,0.4901961,1)
		[HDR]_ShalowColor("Shalow Color", Color) = (0.4039216,0.03921569,0,1)
		_DepthColorBlendFalloff("Depth Color Blend Falloff", Range( -5 , 0)) = -1.5
		_WaterDepth("Water Depth", Float) = 0.5
		[Header(Motion Vector UVs (ENABLE ALL TICKS BELOW TO USE))][NoScaleOffset]_MotionVectors("Motion Vectors", 2D) = "white" {}
		[Toggle(_SWITCHTOMOTIONVECTORX_ON)] _SwitchToMotionVectorX("Switch To Motion Vector X", Float) = 0
		[Toggle(_SWITCHTOMOTIONVECTORSCALEY_ON)] _SwitchToMotionVectorScaleY("Switch To Motion Vector Scale Y", Float) = 0
		[Toggle(_SWITCHTOMOTIONVECTORY_ON)] _SwitchToMotionVectorY("Switch To Motion Vector Y", Float) = 0
		[Toggle(_SWITCHTOMOTIONVECTORSCALEX_ON)] _SwitchToMotionVectorScaleX("Switch To Motion Vector Scale X", Float) = 0
		_NormalTilingXMV("Normal Tiling X (MV)", Int) = 1
		_NormalTilingYMV("Normal Tiling Y (MV)", Int) = 1
		_UVMotionIntensity("UV Motion Intensity", Range( -1 , 1)) = 1
		_UVMotionSpeed("UV Motion Speed", Range( -15 , 15)) = 0.5
		[Header(Vertex Displacement Options)]_Displacement3DTexture("Displacement 3D Texture", 3D) = "white" {}
		[Toggle(_USEVERTEXDISPLACEMENTWAVES_ON)] _UseVertexDisplacementWaves("Use Vertex Displacement (Waves)", Float) = 0
		_DisplacementTiling("Displacement Tiling", Float) = 1
		_WaveSpeed("Wave Speed", Float) = 0.5
		_WaveHeight("Wave Height", Range( 0 , 5)) = 0.5
		[Header(Foam)]_Foam("Foam", 2D) = "white" {}
		[Toggle(_USEFOAM_ON)] _UseFoam("Use Foam", Float) = 0
		_FoamDepth("Foam Depth", Range( 0 , 3)) = 1.1
		_FoamFalloff("Foam Falloff", Range( -20 , 20)) = -10
		[HDR]_FoamColor("Foam Color", Color) = (1,1,1,0)
		[Header(Parallax)][NoScaleOffset]_ParallaxMap("Height Map", 2D) = "white" {}
		[Toggle(_USEPARALLAX_ON)] _UseParallax("Use Parallax", Float) = 0
		_ParallaxHeightScale("Parallax Height Scale", Range( 0 , 0.2)) = 0
		[Header(Alpha Masking (INPUT TEXTURE AND SET CLIP AMOUNT TO MORE THAN 0))]_AlphaMask("Alpha Mask", 2D) = "white" {}
		[Toggle(_USEALPHAMASK_ON)] _UseAlphaMask("Use Alpha Mask", Float) = 0
		_AlphaClip("Alpha Clip", Range( 0 , 1)) = 0.1
		[Space(20)][Header(BRDF Lut)][Space(10)][Toggle(_BRDFMAP)] BRDFMAP("Enable BRDF map", Float) = 0
		[ASEEnd][NoScaleOffset][SingleLineTexture]g_tBRDFMap("BRDF map", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		[Space(30)][Header(Screen Space Reflections)][Space(10)][Toggle(_NO_SSR)] _SSROff("Disable SSR", Float) = 0
		[Header(This should be 0 for skinned meshes)]
		_SSRTemporalMul("Temporal Accumulation Factor", Range(0, 2)) = 1.0
		//[Toggle(_SM6_QUAD)] _SM6_Quad("Quad-avg SSR", Float) = 0


	}
	SubShader
	{
		LOD 0

		
		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" }
		
		Blend One OneMinusSrcAlpha
		ZWrite Off
		Cull Off
		ZTest LEqual
		Offset 0 , 0
		ColorMask RGBA
		//LOD 100
		

		
		Pass
		{

			

			Name "Forward"
			Tags { "Lightmode"="UniversalForward" }
			
			HLSLPROGRAM
			#pragma multi_compile_fog
			#define LITMAS_FEATURE_LIGHTMAPPING
			#pragma multi_compile_fragment _ _VOLUMETRICS_ENABLED
			#define LITMAS_FEATURE_EMISSION
			#define PC_REFLECTION_PROBE_BLENDING
			#define PC_REFLECTION_PROBE_BOX_PROJECTION
			#define PC_RECEIVE_SHADOWS
			#define PC_SSAO
			#define MOBILE_LIGHTS_VERTEX
			#define _ISTRANSPARENT
			#define _SurfaceTransparent
			#pragma multi_compile_instancing
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION -1
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma target 5.0

			
			#define LITMAS_FEATURE_TS_NORMALS
			
			#define LITMAS_FEATURE_SSR
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/PlatformCompiler.hlsl"
			#if defined(SHADER_API_DESKTOP)
			
			
			
			
			#endif

			//StandardForward------------------------------------------------------------------------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//
			//
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
					
					
			#define SHADERPASS SHADERPASS_FORWARD
			#define _NORMAL_DROPOFF_TS 1
			#define _EMISSION
			#define _NORMALMAP 1
					
			#if defined(SHADER_API_MOBILE)
			#if defined(MOBILE_LIGHTS_VERTEX)
				#define _ADDITIONAL_LIGHTS_VERTEX
			#endif
					
			#if defined(MOBILE_RECEIVE_SHADOWS)
				#undef _RECEIVE_SHADOWS_OFF
				#define _MAIN_LIGHT_SHADOWS
				#define _ADDITIONAL_LIGHT_SHADOWS
				#pragma multi_compile_fragment  _  _MAIN_LIGHT_SHADOWS_CASCADE
				#pragma multi_compile_fragment _ _ADDITIONAL_LIGHTS
				#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
				#define _SHADOWS_SOFT 1
			#else
				#define _RECEIVE_SHADOWS_OFF 1
			#endif
					
			#if defined(MOBILE_SSAO)
				#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#endif
					
			#if defined(MOBILE_REFLECTION_PROBE_BLENDING)
				#define _REFLECTION_PROBE_BLENDING
			#endif
					
			#if defined(MOBILE_REFLECTION_PROBE_BOX_PROJECTION)
				#define _REFLECTION_PROBE_BOX_PROJECTION 
			#endif
						
			#else
					
			//#define DYNAMIC_SCREEN_SPACE_OCCLUSION
			#if defined(PC_SSAO)
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#endif
					
			//#define DYNAMIC_ADDITIONAL_LIGHTS
			#if defined(PC_RECEIVE_SHADOWS)
				#undef _RECEIVE_SHADOWS_OFF
				#pragma multi_compile_fragment  _  _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHTS
					
					
			//#define DYNAMIC_ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
					
				#define _SHADOWS_SOFT 1
			#else
				#define _RECEIVE_SHADOWS_OFF 1
			#endif
					
			#if defined(PC_REFLECTION_PROBE_BLENDING)
				#define _REFLECTION_PROBE_BLENDING
			#endif
				//#pragma shader_feature_fragment _REFLECTION_PROBE_BOX_PROJECTION
				// We don't need a keyword for this! the w component of the probe position already branches box vs non-box, & so little cost on pc it doesn't matter
			#if defined(PC_REFLECTION_PROBE_BOX_PROJECTION)
				#define _REFLECTION_PROBE_BOX_PROJECTION 
			#endif
					
			// Begin Injection STANDALONE_DEFINES from Injection_SSR.hlsl ----------------------------------------------------------
			#pragma multi_compile _ _SLZ_SSR_ENABLED
			#pragma shader_feature_local _ _NO_SSR
			#if defined(_SLZ_SSR_ENABLED) && !defined(_NO_SSR) && !defined(SHADER_API_MOBILE)
				#define _SSR_ENABLED
			#endif
			// End Injection STANDALONE_DEFINES from Injection_SSR.hlsl ----------------------------------------------------------
					
			#endif
					
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			//#pragma multi_compile_fragment _ _VOLUMETRICS_ENABLED
			//#pragma multi_compile_fog
			//#pragma skip_variants FOG_LINEAR FOG_EXP
			//#pragma multi_compile_fragment _ DEBUG_DISPLAY
			//#pragma multi_compile_fragment _ _DETAILS_ON
			//#pragma multi_compile_fragment _ _EMISSION_ON
					
					
			#if defined(LITMAS_FEATURE_LIGHTMAPPING)
				#pragma multi_compile _ LIGHTMAP_ON
				#pragma multi_compile _ DYNAMICLIGHTMAP_ON
				#pragma multi_compile _ DIRLIGHTMAP_COMBINED
				#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#endif
					
					
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Packing.hlsl"
			#undef UNITY_DECLARE_DEPTH_TEXTURE_INCLUDED
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SLZLighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SLZBlueNoise.hlsl"
					
			// Begin Injection INCLUDES from Injection_SSR.hlsl ----------------------------------------------------------
			#if !defined(SHADER_API_MOBILE)
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SLZLightingSSR.hlsl"
			#endif
			// End Injection INCLUDES from Injection_SSR.hlsl ----------------------------------------------------------
					
					
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment _BRDFMAP
			#pragma shader_feature_local _USEVERTEXDISPLACEMENTWAVES_ON
			#pragma shader_feature_local _USEFOAM_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORY_ON
			#pragma shader_feature_local _USEPARALLAX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORSCALEX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORSCALEY_ON
			#pragma shader_feature_local _USEALPHAMASK_ON
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SLZBlueNoise.hlsl"

					
			struct VertIn
			{
				float4 vertex   : POSITION;
				float3 normal    : NORMAL;
				float4 tangent   : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};
			
			struct VertOut
			{
				float4 vertex       : SV_POSITION;
				float4 uv0XY_bitZ_fog : TEXCOORD0;
			#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
				float4 uv1 : TEXCOORD1;
			#endif
				half4 SHVertLights : TEXCOORD2;
				half4 normXYZ_tanX : TEXCOORD3;
				float3 wPos : TEXCOORD4;
			
			// Begin Injection INTERPOLATORS from Injection_SSR.hlsl ----------------------------------------------------------
				float4 lastVertex : TEXCOORD5;
			// End Injection INTERPOLATORS from Injection_SSR.hlsl ----------------------------------------------------------
			// Begin Injection INTERPOLATORS from Injection_NormalMaps.hlsl ----------------------------------------------------------
				half4 tanYZ_bitXY : TEXCOORD6;
			// End Injection INTERPOLATORS from Injection_NormalMaps.hlsl ----------------------------------------------------------
			
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
			};
			
			//TEXTURE2D(_BaseMap);
			//SAMPLER(sampler_BaseMap);
			
			//TEXTURE2D(_BumpMap);
			//TEXTURE2D(_MetallicGlossMap);
			
			//TEXTURE2D(_DetailMap);
			//SAMPLER(sampler_DetailMap);
			
			// Begin Injection UNIFORMS from Injection_Emission.hlsl ----------------------------------------------------------
			//TEXTURE2D(_EmissionMap);
			// End Injection UNIFORMS from Injection_Emission.hlsl ----------------------------------------------------------
			
			CBUFFER_START(UnityPerMaterial)
				float4 _FoamColor;
				float4 _WaterColor;
				float4 _DeepColor;
				float4 _ShalowColor;
				float4 _Foam_ST;
				float4 _AlphaMask_ST;
				float4 _ParallaxMap_ST;
				float2 _NormalTiling;
				float _WaterSmoothness;
				float _DistortionIntensity;
				float _NormalIntensity;
				float _UVMotionIntensity;
				float _UVMotionSpeed;
				int _NormalTilingXMV;
				int _NormalTilingYMV;
				float _DisplacementTiling;
				float _FoamFalloff;
				float _FoamDepth;
				float _DepthColorBlendFalloff;
				float _WaterDepth;
				float _WaveHeight;
				float _WaveSpeed;
				float _ParallaxHeightScale;
				float _AlphaClip;
				//float4 _BaseMap_ST;
				//half4 _BaseColor;
			// Begin Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			//float4 _DetailMap_ST;
			//half  _Details;
			//half  _Normals;
			// End Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
				float _SSRTemporalMul;
			// End Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_Emission.hlsl ----------------------------------------------------------
				//half  _Emission;
				//half4 _EmissionColor;
				//half  _EmissionFalloff;
				//half  _BakedMutiplier;
			// End Injection MATERIAL_CBUFFER from Injection_Emission.hlsl ----------------------------------------------------------
				//int _Surface;
			CBUFFER_END
			sampler3D _Displacement3DTexture;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _Foam;
			sampler2D _BumpMap;
			sampler2D _ParallaxMap;
			sampler2D _MotionVectors;
			sampler2D _AlphaMask;

			
			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			inline float2 POM( sampler2D heightMap, float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = tex2Dgrad( heightMap, uvs + currTexOffset, dx, dy ).r;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = 2;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = tex2Dgrad( heightMap, uvs + finalTexOffset, dx, dy ).r;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			
			
			half3 OverlayBlendDetail(half source, half3 destination)
			{
				half3 switch0 = round(destination); // if destination >= 0.5 then 1, else 0 assuming 0-1 input
				half3 blendGreater = mad(mad(2.0, destination, -2.0), 1.0 - source, 1.0); // (2.0 * destination - 2.0) * ( 1.0 - source) + 1.0
				half3 blendLesser = (2.0 * source) * destination;
				return mad(switch0, blendGreater, mad(-switch0, blendLesser, blendLesser)); // switch0 * blendGreater + (1 - switch0) * blendLesser 
				//return half3(destination.r > 0.5 ? blendGreater.r : blendLesser.r,
				//             destination.g > 0.5 ? blendGreater.g : blendLesser.g,
				//             destination.b > 0.5 ? blendGreater.b : blendLesser.b
				//            );
			}
			
			
			VertOut vert(VertIn v  )
			{
				VertOut o = (VertOut)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
			
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float mulTime211 = _TimeParameters.x * _WaveSpeed;
				float3 appendResult212 = (float3(( ase_worldPos.x * _DisplacementTiling ) , ( ase_worldPos.z * _DisplacementTiling ) , mulTime211));
				float3 _3duvs213 = appendResult212;
				float4 tex3DNode183 = tex3Dlod( _Displacement3DTexture, float4( _3duvs213, 0.0) );
				float4 vertexOffset189 = ( tex3DNode183 * float4( ( float3(0,1,0) * (0.0 + (_WaveHeight - 0.0) * (0.5 - 0.0) / (1.0 - 0.0)) ) , 0.0 ) );
				#ifdef _USEVERTEXDISPLACEMENTWAVES_ON
				float4 staticSwitch425 = vertexOffset189;
				#else
				float4 staticSwitch425 = float4( 0,0,0,0 );
				#endif
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord7 = screenPos;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangent.xyz);
				o.ase_texcoord8.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normal);
				o.ase_texcoord9.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord10.xyz = ase_worldBitangent;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;
				o.ase_texcoord9.w = 0;
				o.ase_texcoord10.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = staticSwitch425.rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.normal = v.normal;
			
				o.wPos = TransformObjectToWorld(v.vertex.xyz);
				o.vertex = TransformWorldToHClip(o.wPos);
				o.uv0XY_bitZ_fog.xy = v.uv0.xy;
			
			#if defined(LIGHTMAP_ON) || defined(DIRLIGHTMAP_COMBINED)
				OUTPUT_LIGHTMAP_UV(v.uv1.xy, unity_LightmapST, o.uv1.xy);
			#endif
			
			#ifdef DYNAMICLIGHTMAP_ON
				OUTPUT_LIGHTMAP_UV(v.uv2.xy, unity_DynamicLightmapST, o.uv1.zw);
			#endif
			
				// Exp2 fog
				half clipZ_0Far = UNITY_Z_0_FAR_FROM_CLIPSPACE(o.vertex.z);
				o.uv0XY_bitZ_fog.w = unity_FogParams.x * clipZ_0Far;
			
			// Begin Injection VERTEX_NORMALS from Injection_NormalMaps.hlsl ----------------------------------------------------------
				VertexNormalInputs ntb = GetVertexNormalInputs(v.normal, v.tangent);
				o.normXYZ_tanX = half4(ntb.normalWS, ntb.tangentWS.x);
				o.tanYZ_bitXY = half4(ntb.tangentWS.yz, ntb.bitangentWS.xy);
				o.uv0XY_bitZ_fog.z = ntb.bitangentWS.z;
			// End Injection VERTEX_NORMALS from Injection_NormalMaps.hlsl ----------------------------------------------------------
			
				o.SHVertLights = 0;
				// Calculate vertex lights and L2 probe lighting on quest 
				o.SHVertLights.xyz = VertexLighting(o.wPos, o.normXYZ_tanX.xyz);
			#if !defined(LIGHTMAP_ON) && !defined(DYNAMICLIGHTMAP_ON) && defined(SHADER_API_MOBILE)
				o.SHVertLights.xyz += SampleSHVertex(o.normXYZ_tanX.xyz);
			#endif
			
			// Begin Injection VERTEX_END from Injection_SSR.hlsl ----------------------------------------------------------
				#if defined(_SSR_ENABLED)
					float4 lastWPos = mul(GetPrevObjectToWorldMatrix(), v.vertex);
					o.lastVertex = mul(prevVP, lastWPos);
				#endif
			// End Injection VERTEX_END from Injection_SSR.hlsl ----------------------------------------------------------
				return o;
			}
			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			
			half4 frag(VertOut i 
				#ifdef ASE_DEPTH_WRITE_ON
				, out float outputDepth : ASE_SV_DEPTH
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				float4 screenPos = i.ase_texcoord7;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth1 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_89_0 = abs( ( eyeDepth1 - screenPos.w ) );
				float temp_output_94_0 = saturate( pow( ( temp_output_89_0 + _WaterDepth ) , _DepthColorBlendFalloff ) );
				float4 lerpResult13 = lerp( _DeepColor , _ShalowColor , temp_output_94_0);
				float2 uv_Foam = i.uv0XY_bitZ_fog.xy * _Foam_ST.xy + _Foam_ST.zw;
				float2 panner116 = ( 1.0 * _Time.y * float2( -0.01,0.01 ) + uv_Foam);
				float4 temp_output_114_0 = ( saturate( pow( ( temp_output_89_0 + _FoamDepth ) , _FoamFalloff ) ) * ( tex2D( _Foam, panner116 ) * _FoamColor ) );
				#ifdef _USEFOAM_ON
				float4 staticSwitch426 = temp_output_114_0;
				#else
				float4 staticSwitch426 = float4( 0,0,0,0 );
				#endif
				float4 lerpResult117 = lerp( lerpResult13 , float4(1,1,1,0) , staticSwitch426);
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 texCoord451 = float4(i.uv0XY_bitZ_fog.xy,0,0);
				texCoord451.xy = float4(i.uv0XY_bitZ_fog.xy,0,0).xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USEPARALLAX_ON
				float staticSwitch460 = _ParallaxHeightScale;
				#else
				float staticSwitch460 = 0.0;
				#endif
				float3 ase_worldTangent = i.ase_texcoord8.xyz;
				float3 ase_worldNormal = i.ase_texcoord9.xyz;
				float3 ase_worldBitangent = i.ase_texcoord10.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - i.wPos.xyz );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 OffsetPOM452 = POM( _ParallaxMap, texCoord451.xy, ddx(texCoord451.xy), ddy(texCoord451.xy), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, 8, 8, staticSwitch460, 0, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 texCoord401 = i.uv0XY_bitZ_fog.xy * _NormalTiling + float2( 0,0 );
				float2 panner402 = ( 1.0 * _Time.y * float2( -0.03,0 ) + texCoord401);
				float2 texCoord372 = i.uv0XY_bitZ_fog.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult365 = (float2((float)_NormalTilingYMV , (float)_NormalTilingXMV));
				float2 temp_output_373_0 = ( texCoord372 / appendResult365 );
				float mulTime334 = _TimeParameters.x * _UVMotionSpeed;
				float temp_output_369_0 = ( floor( mulTime334 ) / _NormalTilingYMV );
				float2 appendResult374 = (float2(frac( temp_output_369_0 ) , ( ( 1.0 - frac( ( floor( temp_output_369_0 ) / _NormalTilingXMV ) ) ) - (float)( 1 / _NormalTilingXMV ) )));
				float2 temp_output_339_0 = ( temp_output_373_0 + appendResult374 );
				float2 temp_cast_5 = (0.5).xx;
				#ifdef _SWITCHTOMOTIONVECTORY_ON
				float2 staticSwitch405 = ( OffsetPOM452 + ( temp_output_339_0 + ( ( (tex2D( _MotionVectors, temp_output_339_0 )).rg - temp_cast_5 ) * frac( mulTime334 ) * -_UVMotionIntensity ) ) );
				#else
				float2 staticSwitch405 = ( OffsetPOM452 + panner402 );
				#endif
				#ifdef _SWITCHTOMOTIONVECTORSCALEX_ON
				float staticSwitch414 = ( 1.0 - frac( mulTime334 ) );
				#else
				float staticSwitch414 = _NormalIntensity;
				#endif
				float3 unpack326 = UnpackNormalScale( tex2D( _BumpMap, staticSwitch405 ), staticSwitch414 );
				unpack326.z = lerp( 1, unpack326.z, saturate(staticSwitch414) );
				float2 panner403 = ( 1.0 * _Time.y * float2( 0.04,0.04 ) + texCoord401);
				float temp_output_358_0 = ( ceil( mulTime334 ) / _NormalTilingYMV );
				float2 appendResult375 = (float2(frac( temp_output_358_0 ) , ( ( 1.0 - frac( ( floor( temp_output_358_0 ) / _NormalTilingXMV ) ) ) - (float)( 1 / _NormalTilingXMV ) )));
				float2 temp_output_367_0 = ( temp_output_373_0 + appendResult375 );
				float2 temp_cast_9 = (0.5).xx;
				#ifdef _SWITCHTOMOTIONVECTORX_ON
				float2 staticSwitch404 = ( OffsetPOM452 + ( temp_output_367_0 + ( ( (tex2D( _MotionVectors, temp_output_367_0 )).rg - temp_cast_9 ) * ( 1.0 - frac( mulTime334 ) ) * -_UVMotionIntensity * -1.0 ) ) );
				#else
				float2 staticSwitch404 = ( OffsetPOM452 + panner403 );
				#endif
				#ifdef _SWITCHTOMOTIONVECTORSCALEY_ON
				float staticSwitch413 = frac( mulTime334 );
				#else
				float staticSwitch413 = _NormalIntensity;
				#endif
				float3 unpack328 = UnpackNormalScale( tex2D( _BumpMap, staticSwitch404 ), staticSwitch413 );
				unpack328.z = lerp( 1, unpack328.z, saturate(staticSwitch413) );
				float3 temp_output_325_0 = BlendNormal( unpack326 , unpack328 );
				float4 fetchOpaqueVal65 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (ase_grabScreenPosNorm).xyzw + float4( ( temp_output_325_0 * _DistortionIntensity ) , 0.0 ) ).xy ), 1.0 );
				float4 lerpResult93 = lerp( lerpResult117 , fetchOpaqueVal65 , temp_output_94_0);
				
				float lerpResult133 = lerp( _WaterSmoothness , 1.0 , temp_output_114_0.r);
				
				float2 uv_AlphaMask = i.uv0XY_bitZ_fog.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
				
				#ifdef _USEALPHAMASK_ON
				float staticSwitch467 = _AlphaClip;
				#else
				float staticSwitch467 = 0.0;
				#endif
				
			
			//--------------------------------------------------------------------------------------------------------------------------
			//--Read Input Data---------------------------------------------------------------------------------------------------------
			//--------------------------------------------------------------------------------------------------------------------------
			
				//float2 uv_main = mad(float2(i.uv0XY_bitZ_fog.xy), _BaseMap_ST.xy, _BaseMap_ST.zw);
				//float2 uv_detail = mad(float2(i.uv0XY_bitZ_fog.xy), _DetailMap_ST.xy, _DetailMap_ST.zw);
				//half4 albedo = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, uv_main);
				//half4 mas = SAMPLE_TEXTURE2D(_MetallicGlossMap, sampler_BaseMap, uv_main);
			
			
			
				//albedo *= _BaseColor;
				//half metallic = mas.r;
				//half ao = mas.g;
				//half smoothness = mas.b;
			
			
			//---------------------------------------------------------------------------------------------------------------------------
			//---Sample Normal Map-------------------------------------------------------------------------------------------------------
			//---------------------------------------------------------------------------------------------------------------------------
			
				//half3 normalTS = half3(0, 0, 1);
				//half  geoSmooth = 1;
				//half4 normalMap = half4(0, 0, 1, 0);
			
				half3 albedo3 = ( ( _WaterColor * lerpResult93 ) + staticSwitch426 ).rgb;
				half3 normalTS = temp_output_325_0;
				half3 emission = half3(0,0,0);
				half3 emissionbaked = half3(0,0,0);
			
			// Begin Injection NORMAL_MAP from Injection_NormalMaps.hlsl ----------------------------------------------------------
				//normalMap = SAMPLE_TEXTURE2D(_BumpMap, sampler_BaseMap, uv_main);
				//normalTS = UnpackNormal(normalMap);
				//normalTS = _Normals ? normalTS : half3(0, 0, 1);
				//geoSmooth = _Normals ? normalMap.b : 1.0;
				//smoothness = saturate(smoothness + geoSmooth - 1.0);
			// End Injection NORMAL_MAP from Injection_NormalMaps.hlsl ----------------------------------------------------------
				half metallic = half(0);
				half3 specular = half3(0.5, 0.5, 0.5);
				half smoothness = lerpResult133;
				half ao = half(1);
				half alpha = tex2D( _AlphaMask, uv_AlphaMask ).a;
				half alphaclip = staticSwitch467;
				half alphaclipthresholdshadow = half(0);
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif
			
				#if defined(_ALPHATEST_ON)
					clip(alpha - alphaclip);
				#endif
			
				#if defined(_ISTRANSPARENT)
					_SSRTemporalMul = 0.0;
				#endif
				half4 albedo = half4(albedo3.rgb, alpha);
			
			//---------------------------------------------------------------------------------------------------------------------------
			//---Read Detail Map---------------------------------------------------------------------------------------------------------
			//---------------------------------------------------------------------------------------------------------------------------
			
				//#if defined(_DETAILS_ON) 
			
			// Begin Injection DETAIL_MAP from Injection_NormalMaps.hlsl ----------------------------------------------------------
					//half4 detailMap = SAMPLE_TEXTURE2D(_DetailMap, sampler_DetailMap, uv_detail);
					//half3 detailTS = half3(2.0 * detailMap.ag - 1.0, 1.0);
					//normalTS = BlendNormal(normalTS, detailTS);
			// End Injection DETAIL_MAP from Injection_NormalMaps.hlsl ----------------------------------------------------------
				   
					//smoothness = saturate(2.0 * detailMap.b * smoothness);
					//albedo.rgb = OverlayBlendDetail(detailMap.r, albedo.rgb);
			
				//#endif
			
			
			//---------------------------------------------------------------------------------------------------------------------------
			//---Transform Normals To Worldspace-----------------------------------------------------------------------------------------
			//---------------------------------------------------------------------------------------------------------------------------
			
			// Begin Injection NORMAL_TRANSFORM from Injection_NormalMaps.hlsl ----------------------------------------------------------
				half3 normalWS = i.normXYZ_tanX.xyz;
				half3x3 TStoWS = half3x3(
					i.normXYZ_tanX.w, i.tanYZ_bitXY.z, normalWS.x,
					i.tanYZ_bitXY.x, i.tanYZ_bitXY.w, normalWS.y,
					i.tanYZ_bitXY.y, i.uv0XY_bitZ_fog.z, normalWS.z
					);
				normalWS = mul(TStoWS, normalTS);
				normalWS = normalize(normalWS);
			// End Injection NORMAL_TRANSFORM from Injection_NormalMaps.hlsl ----------------------------------------------------------
				
				
			//---------------------------------------------------------------------------------------------------------------------------//
			//---Lighting Calculations---------------------------------------------------------------------------------------------------//
			//---------------------------------------------------------------------------------------------------------------------------//
				
			// Begin Injection SPEC_AA from Injection_NormalMaps.hlsl ----------------------------------------------------------
				#if !defined(SHADER_API_MOBILE) && !defined(LITMAS_FEATURE_TP) // Specular antialiasing based on normal derivatives. Only on PC to avoid cost of derivatives on Quest
					smoothness = min(smoothness, SLZGeometricSpecularAA(normalWS));
				#endif
			// End Injection SPEC_AA from Injection_NormalMaps.hlsl ----------------------------------------------------------
				
				
				#if defined(LIGHTMAP_ON)
					SLZFragData fragData = SLZGetFragData(i.vertex, i.wPos, normalWS, i.uv1.xy, i.uv1.zw, i.SHVertLights.xyz);
				#else
					SLZFragData fragData = SLZGetFragData(i.vertex, i.wPos, normalWS, float2(0, 0), float2(0, 0), i.SHVertLights.xyz);
				#endif
				
				//half4 emission = half4(0,0,0,0);
				
			// Begin Injection EMISSION from Injection_Emission.hlsl ----------------------------------------------------------
				//UNITY_BRANCH if (_Emission)
				//{
					//emission += SAMPLE_TEXTURE2D(_EmissionMap, sampler_BaseMap, uv_main) * _EmissionColor;
					//emission.rgb *= lerp(albedo.rgb, half3(1, 1, 1), emission.a);
					//emission.rgb *= pow(abs(fragData.NoV), _EmissionFalloff);
				//}
			// End Injection EMISSION from Injection_Emission.hlsl ----------------------------------------------------------
				
				
				#if !defined(_SLZ_SPECULAR_SETUP)
				SLZSurfData surfData = SLZGetSurfDataMetallicGloss(albedo.rgb, saturate(metallic), saturate(smoothness), ao, emission.rgb, albedo.a);
				#else
				SLZSurfData surfData;
			    surfData.albedo = albedo.rgb;
			    surfData.specular = specular.rgb;
			    surfData.perceptualRoughness = half(1.0) - saturate(smoothness);
			    surfData.reflectivity = (specular.r + specular.g + specular.b) / half(3.0);
			    surfData.roughness = max(surfData.perceptualRoughness * surfData.perceptualRoughness, 1.0e-3h);
			    surfData.emission = emission.rgb;
			    surfData.occlusion = ao;
			    surfData.alpha = alpha;
				#endif
				
				half4 color = half4(1, 1, 1, 1);
				
				#if defined(_SurfaceOpaque)
				int _Surface = 0;
				#elif defined(_SurfaceTransparent)
				int _Surface = 1;
				#elif defined(_SurfaceFade)
				int _Surface = 2;
				#else
				int _Surface = 0;
				#endif
				
			// Begin Injection LIGHTING_CALC from Injection_SSR.hlsl ----------------------------------------------------------
				#if defined(_SSR_ENABLED)
					half4 noiseRGBA = GetScreenNoiseRGBA(fragData.screenUV);
				
					SSRExtraData ssrExtra;
					ssrExtra.meshNormal = i.normXYZ_tanX.xyz;
					ssrExtra.lastClipPos = i.lastVertex;
					ssrExtra.temporalWeight = _SSRTemporalMul;
					ssrExtra.depthDerivativeSum = 0;
					ssrExtra.noise = noiseRGBA;
					ssrExtra.fogFactor = i.uv0XY_bitZ_fog.w;
				
					color = SLZPBRFragmentSSR(fragData, surfData, ssrExtra, _Surface);
					color.rgb = max(0, color.rgb);
				#else
					color = SLZPBRFragment(fragData, surfData, _Surface);
				#endif
			// End Injection LIGHTING_CALC from Injection_SSR.hlsl ----------------------------------------------------------
				
				
			// Begin Injection VOLUMETRIC_FOG from Injection_SSR.hlsl ----------------------------------------------------------
				#if !defined(_SSR_ENABLED)
					color = MixFogSurf(color, -fragData.viewDir, i.uv0XY_bitZ_fog.w, _Surface);
					
					color = VolumetricsSurf(color, fragData.position, _Surface);
				#endif
			// End Injection VOLUMETRIC_FOG from Injection_SSR.hlsl ----------------------------------------------------------
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
				
				return color;
			}
			//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

			ENDHLSL
		}

		
		Pass
		{
			

			Name "DepthOnly"
			Tags { "Lightmode"="DepthOnly" }
			
			
			ColorMask 0

			HLSLPROGRAM
			#pragma multi_compile_fog
			#define LITMAS_FEATURE_LIGHTMAPPING
			#pragma multi_compile_fragment _ _VOLUMETRICS_ENABLED
			#define LITMAS_FEATURE_EMISSION
			#define PC_REFLECTION_PROBE_BLENDING
			#define PC_REFLECTION_PROBE_BOX_PROJECTION
			#define PC_RECEIVE_SHADOWS
			#define PC_SSAO
			#define MOBILE_LIGHTS_VERTEX
			#define _ISTRANSPARENT
			#define _SurfaceTransparent
			#pragma multi_compile_instancing
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION -1

			#pragma vertex vert
			#pragma fragment frag
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/PlatformCompiler.hlsl"
			//DepthOnly------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Packing.hlsl"

			#pragma shader_feature_local_fragment _BRDFMAP
			#pragma shader_feature_local _USEVERTEXDISPLACEMENTWAVES_ON
			#pragma shader_feature_local _USEALPHAMASK_ON
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SLZBlueNoise.hlsl"


			struct appdata
			{
			    float4 vertex : POSITION;
			
				float4 ase_texcoord : TEXCOORD0;
			    UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f
			{
			    float4 vertex : SV_POSITION;
			
				float4 ase_texcoord : TEXCOORD0;
			    UNITY_VERTEX_INPUT_INSTANCE_ID
			    UNITY_VERTEX_OUTPUT_STEREO
			};
			sampler3D _Displacement3DTexture;
			sampler2D _AlphaMask;
			CBUFFER_START( UnityPerMaterial )
			float4 _FoamColor;
			float4 _WaterColor;
			float4 _DeepColor;
			float4 _ShalowColor;
			float4 _Foam_ST;
			float4 _AlphaMask_ST;
			float4 _ParallaxMap_ST;
			float2 _NormalTiling;
			float _WaterSmoothness;
			float _DistortionIntensity;
			float _NormalIntensity;
			float _UVMotionIntensity;
			float _UVMotionSpeed;
			int _NormalTilingXMV;
			int _NormalTilingYMV;
			float _DisplacementTiling;
			float _FoamFalloff;
			float _FoamDepth;
			float _DepthColorBlendFalloff;
			float _WaterDepth;
			float _WaveHeight;
			float _WaveSpeed;
			float _ParallaxHeightScale;
			float _AlphaClip;
			CBUFFER_END


			
			v2f vert(appdata v )
			{
			    v2f o;
			    UNITY_SETUP_INSTANCE_ID(v);
			    UNITY_TRANSFER_INSTANCE_ID(v, o);
			    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

			    float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
			    float mulTime211 = _TimeParameters.x * _WaveSpeed;
			    float3 appendResult212 = (float3(( ase_worldPos.x * _DisplacementTiling ) , ( ase_worldPos.z * _DisplacementTiling ) , mulTime211));
			    float3 _3duvs213 = appendResult212;
			    float4 tex3DNode183 = tex3Dlod( _Displacement3DTexture, float4( _3duvs213, 0.0) );
			    float4 vertexOffset189 = ( tex3DNode183 * float4( ( float3(0,1,0) * (0.0 + (_WaveHeight - 0.0) * (0.5 - 0.0) / (1.0 - 0.0)) ) , 0.0 ) );
			    #ifdef _USEVERTEXDISPLACEMENTWAVES_ON
			    float4 staticSwitch425 = vertexOffset189;
			    #else
			    float4 staticSwitch425 = float4( 0,0,0,0 );
			    #endif
			    
			    o.ase_texcoord.xyz = v.ase_texcoord.xyz;
			    
			    //setting value to unused interpolator channels and avoid initialization warnings
			    o.ase_texcoord.w = 0;
			    #ifdef ASE_ABSOLUTE_VERTEX_POS
			        float3 defaultVertexValue = v.vertex.xyz;
			    #else
			        float3 defaultVertexValue = float3(0, 0, 0);
			    #endif
			    float3 vertexValue = staticSwitch425.rgb;
			    #ifdef ASE_ABSOLUTE_VERTEX_POS
			        v.vertex.xyz = vertexValue;
			    #else
			        v.vertex.xyz += vertexValue;
			    #endif
			
			    o.vertex = TransformObjectToHClip(v.vertex.xyz);
			    return o;
			}
			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
			    #define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
			    #define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(v2f i 
			    #ifdef ASE_DEPTH_WRITE_ON
			    , out float outputDepth : ASE_SV_DEPTH
			    #endif
			     ) : SV_Target
			{
			    UNITY_SETUP_INSTANCE_ID(i);
			    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
			    float2 uv_AlphaMask = i.ase_texcoord.xyz.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
			    
			    #ifdef _USEALPHAMASK_ON
			    float staticSwitch467 = _AlphaClip;
			    #else
			    float staticSwitch467 = 0.0;
			    #endif
			    
			
				half alpha = tex2D( _AlphaMask, uv_AlphaMask ).a;
				half alphaclip = staticSwitch467;
				half alphaclipthresholdshadow = half(0);
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif
				#if defined(_ALPHATEST_ON)
					clip(alpha - alphaclip);
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
			
			    return 0;
			}
			//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "Lightmode"="DepthNormals" }
			
			
			
			

			HLSLPROGRAM
			#pragma multi_compile_fog
			#define LITMAS_FEATURE_LIGHTMAPPING
			#pragma multi_compile_fragment _ _VOLUMETRICS_ENABLED
			#define LITMAS_FEATURE_EMISSION
			#define PC_REFLECTION_PROBE_BLENDING
			#define PC_REFLECTION_PROBE_BOX_PROJECTION
			#define PC_RECEIVE_SHADOWS
			#define PC_SSAO
			#define MOBILE_LIGHTS_VERTEX
			#define _ISTRANSPARENT
			#define _SurfaceTransparent
			#pragma multi_compile_instancing
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION -1

			#pragma vertex vert
			#pragma fragment frag
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/PlatformCompiler.hlsl"
			//StandardDepthNormals-------------------------------------------------------------------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//
			//
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
					
			#define SHADERPASS SHADERPASS_DEPTHNORMALS
					
			#if defined(SHADER_API_MOBILE)
			#else
			#endif
					
					
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Packing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/EncodeNormalsTexture.hlsl"
					
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment _BRDFMAP
			#pragma shader_feature_local _USEVERTEXDISPLACEMENTWAVES_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORY_ON
			#pragma shader_feature_local _USEPARALLAX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORSCALEX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORSCALEY_ON
			#pragma shader_feature_local _USEALPHAMASK_ON
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SLZBlueNoise.hlsl"

					
			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			// Begin Injection VERTEX_IN from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				float4 tangent : TANGENT;
				float2 uv0 : TEXCOORD0;
			// End Injection VERTEX_IN from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				float4 normalWS : NORMAL;
				float2 uv0 : TEXCOORD0;
			// Begin Injection INTERPOLATORS from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				float4 tanYZ_bitXY : TEXCOORD1;
				float4 uv0XY_bitZ_fog : TEXCOORD2;
			// End Injection INTERPOLATORS from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			
			// Begin Injection UNIFORMS from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				//TEXTURE2D(_BumpMap);
				//SAMPLER(sampler_BumpMap);
			// End Injection UNIFORMS from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
			
			CBUFFER_START(UnityPerMaterial)
				float4 _FoamColor;
				float4 _WaterColor;
				float4 _DeepColor;
				float4 _ShalowColor;
				float4 _Foam_ST;
				float4 _AlphaMask_ST;
				float4 _ParallaxMap_ST;
				float2 _NormalTiling;
				float _WaterSmoothness;
				float _DistortionIntensity;
				float _NormalIntensity;
				float _UVMotionIntensity;
				float _UVMotionSpeed;
				int _NormalTilingXMV;
				int _NormalTilingYMV;
				float _DisplacementTiling;
				float _FoamFalloff;
				float _FoamDepth;
				float _DepthColorBlendFalloff;
				float _WaterDepth;
				float _WaveHeight;
				float _WaveSpeed;
				float _ParallaxHeightScale;
				float _AlphaClip;
				//float4 _BaseMap_ST;
				//half4 _BaseColor;
			// Begin Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			//float4 _DetailMap_ST;
			//half  _Details;
			//half  _Normals;
			// End Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
				float _SSRTemporalMul;
			// End Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_Emission_CBuffer.hlsl ----------------------------------------------------------
				//half  _Emission;
				//half4 _EmissionColor;
				//half  _EmissionFalloff;
				//half  _BakedMutiplier;
			// End Injection MATERIAL_CBUFFER from Injection_Emission_CBuffer.hlsl ----------------------------------------------------------
				//int _Surface;
			CBUFFER_END
			sampler3D _Displacement3DTexture;
			sampler2D _BumpMap;
			sampler2D _ParallaxMap;
			sampler2D _MotionVectors;
			sampler2D _AlphaMask;

				
			inline float2 POM( sampler2D heightMap, float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = tex2Dgrad( heightMap, uvs + currTexOffset, dx, dy ).r;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = 2;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = tex2Dgrad( heightMap, uvs + finalTexOffset, dx, dy ).r;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			
			
			v2f vert(appdata v  )
			{
			
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
			
			
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float mulTime211 = _TimeParameters.x * _WaveSpeed;
				float3 appendResult212 = (float3(( ase_worldPos.x * _DisplacementTiling ) , ( ase_worldPos.z * _DisplacementTiling ) , mulTime211));
				float3 _3duvs213 = appendResult212;
				float4 tex3DNode183 = tex3Dlod( _Displacement3DTexture, float4( _3duvs213, 0.0) );
				float4 vertexOffset189 = ( tex3DNode183 * float4( ( float3(0,1,0) * (0.0 + (_WaveHeight - 0.0) * (0.5 - 0.0) / (1.0 - 0.0)) ) , 0.0 ) );
				#ifdef _USEVERTEXDISPLACEMENTWAVES_ON
				float4 staticSwitch425 = vertexOffset189;
				#else
				float4 staticSwitch425 = float4( 0,0,0,0 );
				#endif
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				o.ase_texcoord6.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = staticSwitch425.rgb;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				o.vertex = TransformObjectToHClip(v.vertex.xyz);
				v.normal = v.normal;
			
			// Begin Injection VERTEX_NORMAL from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				VertexNormalInputs ntb = GetVertexNormalInputs(v.normal, v.tangent);
				o.normalWS = float4(ntb.normalWS, ntb.tangentWS.x);
				o.tanYZ_bitXY = float4(ntb.tangentWS.yz, ntb.bitangentWS.xy);
				o.uv0XY_bitZ_fog.zw = ntb.bitangentWS.zz;
				o.uv0XY_bitZ_fog.xy = v.uv0.xy;
			// End Injection VERTEX_NORMAL from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				o.uv0 = v.uv0;
			
				return o;
			}
			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			
			half4 frag(v2f i
				#ifdef ASE_DEPTH_WRITE_ON
				, out float outputDepth : ASE_SV_DEPTH
				#endif
				) : SV_Target
			{
			   UNITY_SETUP_INSTANCE_ID(i);
			   UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
			   float4 texCoord451 = float4(i.uv0.xy,0,0);
			   texCoord451.xy = float4(i.uv0.xy,0,0).xy * float2( 1,1 ) + float2( 0,0 );
			   #ifdef _USEPARALLAX_ON
			   float staticSwitch460 = _ParallaxHeightScale;
			   #else
			   float staticSwitch460 = 0.0;
			   #endif
			   float3 ase_worldTangent = i.ase_texcoord3.xyz;
			   float3 ase_worldNormal = i.ase_texcoord4.xyz;
			   float3 ase_worldBitangent = i.ase_texcoord5.xyz;
			   float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
			   float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
			   float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
			   float3 ase_worldPos = i.ase_texcoord6.xyz;
			   float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
			   ase_worldViewDir = normalize(ase_worldViewDir);
			   float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
			   ase_tanViewDir = normalize(ase_tanViewDir);
			   float2 OffsetPOM452 = POM( _ParallaxMap, texCoord451.xy, ddx(texCoord451.xy), ddy(texCoord451.xy), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, 8, 8, staticSwitch460, 0, _ParallaxMap_ST.xy, float2(0,0), 0 );
			   float2 texCoord401 = i.uv0.xy * _NormalTiling + float2( 0,0 );
			   float2 panner402 = ( 1.0 * _Time.y * float2( -0.03,0 ) + texCoord401);
			   float2 texCoord372 = i.uv0.xy * float2( 1,1 ) + float2( 0,0 );
			   float2 appendResult365 = (float2((float)_NormalTilingYMV , (float)_NormalTilingXMV));
			   float2 temp_output_373_0 = ( texCoord372 / appendResult365 );
			   float mulTime334 = _TimeParameters.x * _UVMotionSpeed;
			   float temp_output_369_0 = ( floor( mulTime334 ) / _NormalTilingYMV );
			   float2 appendResult374 = (float2(frac( temp_output_369_0 ) , ( ( 1.0 - frac( ( floor( temp_output_369_0 ) / _NormalTilingXMV ) ) ) - (float)( 1 / _NormalTilingXMV ) )));
			   float2 temp_output_339_0 = ( temp_output_373_0 + appendResult374 );
			   float2 temp_cast_5 = (0.5).xx;
			   #ifdef _SWITCHTOMOTIONVECTORY_ON
			   float2 staticSwitch405 = ( OffsetPOM452 + ( temp_output_339_0 + ( ( (tex2D( _MotionVectors, temp_output_339_0 )).rg - temp_cast_5 ) * frac( mulTime334 ) * -_UVMotionIntensity ) ) );
			   #else
			   float2 staticSwitch405 = ( OffsetPOM452 + panner402 );
			   #endif
			   #ifdef _SWITCHTOMOTIONVECTORSCALEX_ON
			   float staticSwitch414 = ( 1.0 - frac( mulTime334 ) );
			   #else
			   float staticSwitch414 = _NormalIntensity;
			   #endif
			   float3 unpack326 = UnpackNormalScale( tex2D( _BumpMap, staticSwitch405 ), staticSwitch414 );
			   unpack326.z = lerp( 1, unpack326.z, saturate(staticSwitch414) );
			   float2 panner403 = ( 1.0 * _Time.y * float2( 0.04,0.04 ) + texCoord401);
			   float temp_output_358_0 = ( ceil( mulTime334 ) / _NormalTilingYMV );
			   float2 appendResult375 = (float2(frac( temp_output_358_0 ) , ( ( 1.0 - frac( ( floor( temp_output_358_0 ) / _NormalTilingXMV ) ) ) - (float)( 1 / _NormalTilingXMV ) )));
			   float2 temp_output_367_0 = ( temp_output_373_0 + appendResult375 );
			   float2 temp_cast_9 = (0.5).xx;
			   #ifdef _SWITCHTOMOTIONVECTORX_ON
			   float2 staticSwitch404 = ( OffsetPOM452 + ( temp_output_367_0 + ( ( (tex2D( _MotionVectors, temp_output_367_0 )).rg - temp_cast_9 ) * ( 1.0 - frac( mulTime334 ) ) * -_UVMotionIntensity * -1.0 ) ) );
			   #else
			   float2 staticSwitch404 = ( OffsetPOM452 + panner403 );
			   #endif
			   #ifdef _SWITCHTOMOTIONVECTORSCALEY_ON
			   float staticSwitch413 = frac( mulTime334 );
			   #else
			   float staticSwitch413 = _NormalIntensity;
			   #endif
			   float3 unpack328 = UnpackNormalScale( tex2D( _BumpMap, staticSwitch404 ), staticSwitch413 );
			   unpack328.z = lerp( 1, unpack328.z, saturate(staticSwitch413) );
			   float3 temp_output_325_0 = BlendNormal( unpack326 , unpack328 );
			   
			   float2 uv_AlphaMask = i.uv0.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
			   
			   #ifdef _USEALPHAMASK_ON
			   float staticSwitch467 = _AlphaClip;
			   #else
			   float staticSwitch467 = 0.0;
			   #endif
			   
			
			
			   half4 normals = half4(0, 0, 0, 1);
			   half3 normalTS = temp_output_325_0;
			
			// Begin Injection FRAG_NORMALS from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				//half4 normalMap = SAMPLE_TEXTURE2D(_BumpMap, sampler_BumpMap, i.uv0XY_bitZ_fog.xy);
				//half3 normalTS = UnpackNormal(normalMap);
				//normalTS = _Normals ? normalTS : half3(0, 0, 1);
			
			
				half3x3 TStoWS = half3x3(
					i.normalWS.w, i.tanYZ_bitXY.z, i.normalWS.x,
					i.tanYZ_bitXY.x, i.tanYZ_bitXY.w, i.normalWS.y,
					i.tanYZ_bitXY.y, i.uv0XY_bitZ_fog.z, i.normalWS.z
					);
				half3 normalWS = mul(TStoWS, normalTS);
				normalWS = normalize(normalWS);
				
				normals = half4(EncodeWSNormalForNormalsTex(normalWS),0);
			// End Injection FRAG_NORMALS from Injection_NormalMap_DepthNormals.hlsl ----------------------------------------------------------
				half alpha = tex2D( _AlphaMask, uv_AlphaMask ).a;
				half alphaclip = staticSwitch467;
				half alphaclipthresholdshadow = half(0);
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif
				
				#if defined(_ALPHATEST_ON)
					clip(alpha - alphaclip);
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
				
				return normals;
			}
			//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }
			
			
			Cull Off

			HLSLPROGRAM
			#pragma multi_compile_fog
			#define LITMAS_FEATURE_LIGHTMAPPING
			#pragma multi_compile_fragment _ _VOLUMETRICS_ENABLED
			#define LITMAS_FEATURE_EMISSION
			#define PC_REFLECTION_PROBE_BLENDING
			#define PC_REFLECTION_PROBE_BOX_PROJECTION
			#define PC_RECEIVE_SHADOWS
			#define PC_SSAO
			#define MOBILE_LIGHTS_VERTEX
			#define _ISTRANSPARENT
			#define _SurfaceTransparent
			#pragma multi_compile_instancing
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION -1
			#define REQUIRE_DEPTH_TEXTURE 1
			#define REQUIRE_OPAQUE_TEXTURE 1

			#define _NORMAL_DROPOFF_TS 1
			#define _EMISSION
			#define _NORMALMAP 1

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_META
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/PlatformCompiler.hlsl"
			//StandardMeta.hlsl---------------------------------------------------------------------------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//
			//
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------

			#define SHADERPASS SHADERPASS_META
			#define PASS_META

			#if defined(SHADER_API_MOBILE)


			#else


			#endif

			//#pragma shader_feature _ EDITOR_VISUALIZATION


			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local_fragment _BRDFMAP
			#pragma shader_feature_local _USEVERTEXDISPLACEMENTWAVES_ON
			#pragma shader_feature_local _USEFOAM_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORY_ON
			#pragma shader_feature_local _USEPARALLAX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORSCALEX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORX_ON
			#pragma shader_feature_local _SWITCHTOMOTIONVECTORSCALEY_ON
			#pragma shader_feature_local _USEALPHAMASK_ON
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SLZBlueNoise.hlsl"


			//TEXTURE2D(_BaseMap);
			//SAMPLER(sampler_BaseMap);

			// Begin Injection UNIFORMS from Injection_Emission_Meta.hlsl ----------------------------------------------------------
			//TEXTURE2D(_EmissionMap);
			// End Injection UNIFORMS from Injection_Emission_Meta.hlsl ----------------------------------------------------------

			CBUFFER_START(UnityPerMaterial)
				float4 _FoamColor;
				float4 _WaterColor;
				float4 _DeepColor;
				float4 _ShalowColor;
				float4 _Foam_ST;
				float4 _AlphaMask_ST;
				float4 _ParallaxMap_ST;
				float2 _NormalTiling;
				float _WaterSmoothness;
				float _DistortionIntensity;
				float _NormalIntensity;
				float _UVMotionIntensity;
				float _UVMotionSpeed;
				int _NormalTilingXMV;
				int _NormalTilingYMV;
				float _DisplacementTiling;
				float _FoamFalloff;
				float _FoamDepth;
				float _DepthColorBlendFalloff;
				float _WaterDepth;
				float _WaveHeight;
				float _WaveSpeed;
				float _ParallaxHeightScale;
				float _AlphaClip;
				//float4 _BaseMap_ST;
				//half4 _BaseColor;
			// Begin Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			//float4 _DetailMap_ST;
			//half  _Details;
			//half  _Normals;
			// End Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
				float _SSRTemporalMul;
			// End Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_Emission_CBuffer.hlsl ----------------------------------------------------------
				//half  _Emission;
				//half4 _EmissionColor;
				//half  _EmissionFalloff;
				//half  _BakedMutiplier;
			// End Injection MATERIAL_CBUFFER from Injection_Emission_CBuffer.hlsl ----------------------------------------------------------
				//int _Surface;
			CBUFFER_END
			sampler3D _Displacement3DTexture;
			uniform float4 _CameraDepthTexture_TexelSize;
			sampler2D _Foam;
			sampler2D _BumpMap;
			sampler2D _ParallaxMap;
			sampler2D _MotionVectors;
			sampler2D _AlphaMask;


			struct appdata
			{
				float4 vertex : POSITION;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_tangent : TANGENT;
				float3 ase_normal : NORMAL;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD0;
			
				#ifdef EDITOR_VISUALIZATION
				float4 VizUV : TEXCOORD1;
				float4 LightCoord : TEXCOORD2;
				#endif
			
			
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			inline float2 POM( sampler2D heightMap, float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				int stepIndex = 0;
				int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = tex2Dgrad( heightMap, uvs + currTexOffset, dx, dy ).r;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				int sectionSteps = 2;
				int sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = tex2Dgrad( heightMap, uvs + finalTexOffset, dx, dy ).r;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			

			v2f vert(appdata v  )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float mulTime211 = _TimeParameters.x * _WaveSpeed;
				float3 appendResult212 = (float3(( ase_worldPos.x * _DisplacementTiling ) , ( ase_worldPos.z * _DisplacementTiling ) , mulTime211));
				float3 _3duvs213 = appendResult212;
				float4 tex3DNode183 = tex3Dlod( _Displacement3DTexture, float4( _3duvs213, 0.0) );
				float4 vertexOffset189 = ( tex3DNode183 * float4( ( float3(0,1,0) * (0.0 + (_WaveHeight - 0.0) * (0.5 - 0.0) / (1.0 - 0.0)) ) , 0.0 ) );
				#ifdef _USEVERTEXDISPLACEMENTWAVES_ON
				float4 staticSwitch425 = vertexOffset189;
				#else
				float4 staticSwitch425 = float4( 0,0,0,0 );
				#endif
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				o.ase_texcoord7.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				float3 vertexValue = staticSwitch425.rgb;
				v.vertex.xyz += vertexValue;
			
				o.vertex = UnityMetaVertexPosition(v.vertex.xyz, v.uv1.xy, v.uv2.xy);
				//o.uv = TRANSFORM_TEX(v.uv0.xy, _BaseMap);
			
				o.uv = v.uv0.xy;
				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(v.vertex.xyz, v.uv0.xy, v.uv1.xy, v.uv2.xy, vizUV, lightCoord);
					o.VizUV = float4(vizUV, 0, 0);
					o.LightCoord = lightCoord;
				#endif
			
			
				return o;
			}

			half4 frag(v2f i  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				float4 screenPos = i.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float eyeDepth1 = LinearEyeDepth(SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_screenPosNorm.xy ),_ZBufferParams);
				float temp_output_89_0 = abs( ( eyeDepth1 - screenPos.w ) );
				float temp_output_94_0 = saturate( pow( ( temp_output_89_0 + _WaterDepth ) , _DepthColorBlendFalloff ) );
				float4 lerpResult13 = lerp( _DeepColor , _ShalowColor , temp_output_94_0);
				float2 uv_Foam = i.uv * _Foam_ST.xy + _Foam_ST.zw;
				float2 panner116 = ( 1.0 * _Time.y * float2( -0.01,0.01 ) + uv_Foam);
				float4 temp_output_114_0 = ( saturate( pow( ( temp_output_89_0 + _FoamDepth ) , _FoamFalloff ) ) * ( tex2D( _Foam, panner116 ) * _FoamColor ) );
				#ifdef _USEFOAM_ON
				float4 staticSwitch426 = temp_output_114_0;
				#else
				float4 staticSwitch426 = float4( 0,0,0,0 );
				#endif
				float4 lerpResult117 = lerp( lerpResult13 , float4(1,1,1,0) , staticSwitch426);
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 texCoord451 = float4(i.uv,0,0);
				texCoord451.xy = float4(i.uv,0,0).xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _USEPARALLAX_ON
				float staticSwitch460 = _ParallaxHeightScale;
				#else
				float staticSwitch460 = 0.0;
				#endif
				float3 ase_worldTangent = i.ase_texcoord4.xyz;
				float3 ase_worldNormal = i.ase_texcoord5.xyz;
				float3 ase_worldBitangent = i.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldPos = i.ase_texcoord7.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 OffsetPOM452 = POM( _ParallaxMap, texCoord451.xy, ddx(texCoord451.xy), ddy(texCoord451.xy), ase_worldNormal, ase_worldViewDir, ase_tanViewDir, 8, 8, staticSwitch460, 0, _ParallaxMap_ST.xy, float2(0,0), 0 );
				float2 texCoord401 = i.uv * _NormalTiling + float2( 0,0 );
				float2 panner402 = ( 1.0 * _Time.y * float2( -0.03,0 ) + texCoord401);
				float2 texCoord372 = i.uv * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult365 = (float2((float)_NormalTilingYMV , (float)_NormalTilingXMV));
				float2 temp_output_373_0 = ( texCoord372 / appendResult365 );
				float mulTime334 = _TimeParameters.x * _UVMotionSpeed;
				float temp_output_369_0 = ( floor( mulTime334 ) / _NormalTilingYMV );
				float2 appendResult374 = (float2(frac( temp_output_369_0 ) , ( ( 1.0 - frac( ( floor( temp_output_369_0 ) / _NormalTilingXMV ) ) ) - (float)( 1 / _NormalTilingXMV ) )));
				float2 temp_output_339_0 = ( temp_output_373_0 + appendResult374 );
				float2 temp_cast_5 = (0.5).xx;
				#ifdef _SWITCHTOMOTIONVECTORY_ON
				float2 staticSwitch405 = ( OffsetPOM452 + ( temp_output_339_0 + ( ( (tex2D( _MotionVectors, temp_output_339_0 )).rg - temp_cast_5 ) * frac( mulTime334 ) * -_UVMotionIntensity ) ) );
				#else
				float2 staticSwitch405 = ( OffsetPOM452 + panner402 );
				#endif
				#ifdef _SWITCHTOMOTIONVECTORSCALEX_ON
				float staticSwitch414 = ( 1.0 - frac( mulTime334 ) );
				#else
				float staticSwitch414 = _NormalIntensity;
				#endif
				float3 unpack326 = UnpackNormalScale( tex2D( _BumpMap, staticSwitch405 ), staticSwitch414 );
				unpack326.z = lerp( 1, unpack326.z, saturate(staticSwitch414) );
				float2 panner403 = ( 1.0 * _Time.y * float2( 0.04,0.04 ) + texCoord401);
				float temp_output_358_0 = ( ceil( mulTime334 ) / _NormalTilingYMV );
				float2 appendResult375 = (float2(frac( temp_output_358_0 ) , ( ( 1.0 - frac( ( floor( temp_output_358_0 ) / _NormalTilingXMV ) ) ) - (float)( 1 / _NormalTilingXMV ) )));
				float2 temp_output_367_0 = ( temp_output_373_0 + appendResult375 );
				float2 temp_cast_9 = (0.5).xx;
				#ifdef _SWITCHTOMOTIONVECTORX_ON
				float2 staticSwitch404 = ( OffsetPOM452 + ( temp_output_367_0 + ( ( (tex2D( _MotionVectors, temp_output_367_0 )).rg - temp_cast_9 ) * ( 1.0 - frac( mulTime334 ) ) * -_UVMotionIntensity * -1.0 ) ) );
				#else
				float2 staticSwitch404 = ( OffsetPOM452 + panner403 );
				#endif
				#ifdef _SWITCHTOMOTIONVECTORSCALEY_ON
				float staticSwitch413 = frac( mulTime334 );
				#else
				float staticSwitch413 = _NormalIntensity;
				#endif
				float3 unpack328 = UnpackNormalScale( tex2D( _BumpMap, staticSwitch404 ), staticSwitch413 );
				unpack328.z = lerp( 1, unpack328.z, saturate(staticSwitch413) );
				float3 temp_output_325_0 = BlendNormal( unpack326 , unpack328 );
				float4 fetchOpaqueVal65 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ( (ase_grabScreenPosNorm).xyzw + float4( ( temp_output_325_0 * _DistortionIntensity ) , 0.0 ) ).xy ), 1.0 );
				float4 lerpResult93 = lerp( lerpResult117 , fetchOpaqueVal65 , temp_output_94_0);
				
				float2 uv_AlphaMask = i.uv * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
				
				#ifdef _USEALPHAMASK_ON
				float staticSwitch467 = _AlphaClip;
				#else
				float staticSwitch467 = 0.0;
				#endif
				

				MetaInput metaInput = (MetaInput)0;
			
				float2 uv_main = i.uv;
			
				//half4 albedo = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, i.uv) * _BaseColor;
				//metaInput.Albedo = albedo.rgb;
			
			
				///half4 emission = half4(0, 0, 0, 0);
			
			// Begin Injection EMISSION from Injection_Emission_Meta.hlsl ----------------------------------------------------------
				//if (_Emission)
				//{
					//half4 emissionDefault = _EmissionColor * SAMPLE_TEXTURE2D(_EmissionMap, sampler_BaseMap, i.uv);
					//emissionDefault.rgb *= _BakedMutiplier * _Emission;
					//emissionDefault.rgb *= lerp(albedo.rgb, half3(1, 1, 1), emissionDefault.a);
					//emission += emissionDefault;
				//}
			// End Injection EMISSION from Injection_Emission_Meta.hlsl ----------------------------------------------------------
			
				//metaInput.Emission = emission.rgb;
			
				metaInput.Albedo = ( ( _WaterColor * lerpResult93 ) + staticSwitch426 ).rgb;
				half3 emission = half3(0,0,0);
				half3 bakedemission = emission;
				metaInput.Emission = bakedemission.rgb;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = i.VizUV.xy;
					metaInput.LightCoord = i.LightCoord;
				#endif
			
				half alpha = tex2D( _AlphaMask, uv_AlphaMask ).a;
				half alphaclip = staticSwitch467;
				half alphaclipthresholdshadow = half(0);
				#if defined(_ALPHATEST_ON)
					clip(alpha - alphaclip);
				#endif
				return MetaFragment(metaInput);
			}
			//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
			ENDHLSL
		}

		/*ase_pass*/
		Pass
		{
			
			
			Name "BakedRaytrace"
			Tags{ "LightMode" = "BakedRaytrace" }
			HLSLPROGRAM
			/*ase_pragma_before*/
			#pragma multi_compile _ _EMISSION_ON
			//StandardBakedRT------------------------------------------------------------------------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
			//
			//
			//-----------------------------------------------------------------------------------------------------
			//-----------------------------------------------------------------------------------------------------
					
					
			#define SHADERPASS SHADERPASS_RAYTRACE
					
			#include "UnityRaytracingMeshUtils.cginc"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
					
			/*ase_pragma*/
					
			#pragma raytracing BakeHit
					
			struct RayPayload
			{
			    float4 color;
				float3 dir;
			};
			
			struct AttributeData
			{
			    float2 barycentrics;
			};
			
			struct Vertex
			{
			    float2 texcoord;
			    float3 normal;
			};
			
			// Begin Injection UNIFORMS from Injection_Emission_BakedRT.hlsl ----------------------------------------------------------
			//Texture2D<float4> _BaseMap;
			//SamplerState sampler_BaseMap;
			//Texture2D<float4> _EmissionMap;
			//SamplerState sampler_EmissionMap;
			// End Injection UNIFORMS from Injection_Emission_BakedRT.hlsl ----------------------------------------------------------
			
			CBUFFER_START( UnityPerMaterial )
				/*ase_srp_batcher*/
				//float4 _BaseMap_ST;
				//half4 _BaseColor;
			// Begin Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			//float4 _DetailMap_ST;
			//half  _Details;
			//half  _Normals;
			// End Injection MATERIAL_CBUFFER from Injection_NormalMap_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
				float _SSRTemporalMul;
			// End Injection MATERIAL_CBUFFER from Injection_SSR_CBuffer.hlsl ----------------------------------------------------------
			// Begin Injection MATERIAL_CBUFFER from Injection_Emission_CBuffer.hlsl ----------------------------------------------------------
				//half  _Emission;
				//half4 _EmissionColor;
				//half  _EmissionFalloff;
				//half  _BakedMutiplier;
			// End Injection MATERIAL_CBUFFER from Injection_Emission_CBuffer.hlsl ----------------------------------------------------------
				//int _AlphaPreMult;
			CBUFFER_END
			/*ase_globals*/
			
			/*ase_funcs*/
			
			
			//https://coty.tips/raytracing-in-unity/
			[shader("closesthit")]
			void MyClosestHit(inout RayPayload payload, AttributeData attributes : SV_IntersectionAttributes) {
			
				payload.color = float4(0,0,0,1); //Intializing
				payload.dir = float3(1,0,0);
			
			// Begin Injection CLOSEST_HIT from Injection_Emission_BakedRT.hlsl ----------------------------------------------------------
			uint2 launchIdx = DispatchRaysIndex();
			
			uint primitiveIndex = PrimitiveIndex();
			uint3 triangleIndicies = UnityRayTracingFetchTriangleIndices(primitiveIndex);
			Vertex v0, v1, v2;
			
			v0.texcoord = UnityRayTracingFetchVertexAttribute2(triangleIndicies.x, kVertexAttributeTexCoord0);
			v1.texcoord = UnityRayTracingFetchVertexAttribute2(triangleIndicies.y, kVertexAttributeTexCoord0);
			v2.texcoord = UnityRayTracingFetchVertexAttribute2(triangleIndicies.z, kVertexAttributeTexCoord0);
			
			// v0.normal = UnityRayTracingFetchVertexAttribute3(triangleIndicies.x, kVertexAttributeNormal);
			// v1.normal = UnityRayTracingFetchVertexAttribute3(triangleIndicies.y, kVertexAttributeNormal);
			// v2.normal = UnityRayTracingFetchVertexAttribute3(triangleIndicies.z, kVertexAttributeNormal);
			
			float3 barycentrics = float3(1.0 - attributes.barycentrics.x - attributes.barycentrics.y, attributes.barycentrics.x, attributes.barycentrics.y);
			
			Vertex vInterpolated;
			vInterpolated.texcoord = v0.texcoord * barycentrics.x + v1.texcoord * barycentrics.y + v2.texcoord * barycentrics.z;
			//TODO: Extract normal direction to ignore the backside of emissive objects
			//vInterpolated.normal = v0.normal * barycentrics.x + v1.normal * barycentrics.y + v2.normal * barycentrics.z;
			// if ( dot(vInterpolated.normal, float3(1,0,0) < 0) ) payload.color =  float4(0,10,0,1) ;
			// else payload.color =  float4(10,0,0,1) ;
			
			
			//float4 albedo = float4(_BaseMap.SampleLevel(sampler_BaseMap, vInterpolated.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw, 0).rgb, 1) * _BaseColor;
			
			//float4 emission = _Emission * _EmissionMap.SampleLevel(sampler_EmissionMap, vInterpolated.texcoord * _BaseMap_ST.xy + _BaseMap_ST.zw, 0) * _EmissionColor;
			
			half3 albedo = /*ase_frag_out:Albedo;Float3;_Albedo*/half3(0.5, 0.5, 0.5)/*end*/;
			half3 emission = /*ase_frag_out:Emission;Float3;_Emission*/half3(0,0,0)/*end*/;
			half3 baked_emission = /*ase_frag_out:Baked Emission;Float3;_EmissionBaked*/emission/*end*/;
			//emission.rgb *= lerp(albedo.rgb, 1, emission.a);
			
			//payload.color.rgb = emission.rgb * _BakedMutiplier;
			// End Injection CLOSEST_HIT from Injection_Emission_BakedRT.hlsl ----------------------------------------------------------
			payload.color.rgb = baked_emission.rgb;
			}
			//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

			ENDHLSL
		}
		
	}
	

	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=19102
Node;AmplifyShaderEditor.CommentaryNode;397;-5050.387,-3111.911;Inherit;False;985.4548;1353.154;;2;150;152;Screen/Color Process;1,0,0.3931665,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;152;-5038.918,-3062.42;Inherit;False;513.903;416.8391;;5;89;3;1;2;166;Screen Depth ;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;398;-4499.521,-419.606;Inherit;False;2287.182;667.6771;;3;437;153;159;Misc Functions;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;159;-3651.097,-341.2774;Inherit;False;649.6805;437.5502;;8;13;94;87;11;88;6;12;424;Depth and Color;0,0.504252,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;153;-4470.71,-346.9217;Inherit;False;791.7842;542.9919;;12;225;224;105;106;116;114;113;110;115;431;429;426;Foam;0,1,0.7526436,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;150;-5026.907,-2415.5;Inherit;False;682.6011;387.6005;;5;65;96;98;164;463;Screen Pos and Normal Blend;1,1,1,1;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;174;1838.601,-748.1998;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;623634af11bd9ab448550ee777f3493e;True;DepthOnly;0;1;DepthOnly;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;Lightmode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;175;1838.601,-748.1998;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;623634af11bd9ab448550ee777f3493e;True;DepthNormals;0;2;DepthNormals;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;Lightmode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;176;1838.601,-748.1998;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;623634af11bd9ab448550ee777f3493e;True;ShadowCaster;0;3;ShadowCaster;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;177;1838.601,-748.1998;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;623634af11bd9ab448550ee777f3493e;True;Meta;0;4;Meta;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;416;-3171.125,-1089.049;Inherit;False;1571.821;599.7102;;3;205;178;425;Displacement;0.2712868,0,0.4811321,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;178;-2470.667,-943.8865;Inherit;False;795.6478;421.68;;9;182;179;181;184;189;186;188;183;215;Displace;1,0.7276479,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;205;-3143.762,-980.631;Inherit;False;655.0012;338.6342;;8;206;210;209;212;208;213;214;211;3D Tex UV's;0.4790634,0.1084906,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;216;-3174.012,-1605.496;Inherit;False;399.064;398.4899;;5;133;132;130;104;423;Specular Handling;0.7933207,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;396;-6808.075,-3114.681;Inherit;False;1718.139;1967.709;Blend Normals;2;309;308;Motion Vector;1,0,0.009412766,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;308;-6758.222,-2921.645;Inherit;False;1601.75;868.4727;Credit to SLZ for motion vector setup, slightly modified.;44;339;367;375;373;338;334;360;381;337;345;374;355;394;393;392;371;349;350;379;391;377;347;348;358;372;365;390;356;332;389;368;357;363;343;346;336;341;333;369;331;312;311;310;422;Motion Vectors Input Processing;0.8060138,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;309;-6758.563,-1911.641;Inherit;False;1611.832;718.7075;Credit to SLZ for motion vector setup, slightly modified.;28;314;370;321;354;319;315;366;318;352;329;323;342;322;317;324;320;340;384;330;382;380;387;378;316;344;386;420;421;Motion Vector Interpolation;1,0.4545613,0.08018869,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;310;-5595.817,-2741.06;Inherit;False;200;161;Comment;1;351;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;311;-5376.112,-2536.016;Inherit;False;200;161;Frame Lerp;1;361;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;312;-5372.708,-2738.52;Inherit;False;200;161;UV1;1;335;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;313;-5052.234,-1594.817;Inherit;False;1811.996;1024.735;Blend Normals;20;419;401;403;402;405;326;328;415;404;385;414;327;413;325;456;457;459;458;207;131;Blend Normals;0,0,1,1;0;0
Node;AmplifyShaderEditor.RelayNode;335;-5322.708,-2688.519;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RelayNode;351;-5545.817,-2691.06;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RelayNode;361;-5326.113,-2486.015;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;386;-5947.842,-1802.883;Inherit;False;FLOAT2;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FloorOpNode;331;-6574.752,-2867.6;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;369;-6402.226,-2862.951;Inherit;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;341;-6400.527,-2768.039;Inherit;False;C;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.FloorOpNode;346;-6234.083,-2859.286;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;343;-6062.089,-2859.315;Inherit;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;363;-5913.477,-2861.467;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;357;-5764.67,-2860.511;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;368;-5595.889,-2856.562;Inherit;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;389;-5962.522,-2720.615;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;332;-6267.229,-2670.156;Inherit;False;R;-1;True;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;356;-5926.882,-2755.694;Inherit;False;2;0;INT;1;False;1;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.WireNode;390;-6095.258,-2602.45;Inherit;False;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;365;-5928.152,-2636.308;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;372;-5809.373,-2520.273;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;358;-6410.617,-2532.926;Inherit;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;348;-6276.141,-2527.898;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;347;-6144.46,-2528.493;Inherit;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;377;-5988.723,-2521.537;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;391;-6070.996,-2433.585;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;379;-6407.622,-2430.326;Inherit;False;2;0;INT;1;False;1;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.FractNode;350;-6269.095,-2436.813;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;349;-6144.152,-2419.093;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;371;-5986.803,-2427.067;Inherit;False;2;0;FLOAT;0;False;1;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;392;-6205.603,-2350.524;Inherit;False;1;0;INT;0;False;1;INT;0
Node;AmplifyShaderEditor.WireNode;393;-5842.385,-2234.947;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;394;-5856.385,-2199.947;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;355;-5768.431,-2751.89;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;374;-5439.961,-2860.548;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FractNode;345;-5304.717,-2279.828;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FractNode;337;-5276.08,-2836.873;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FractNode;381;-6624.293,-2568.93;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;334;-6743.709,-2772.527;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RelayNode;338;-6714.945,-2866.776;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;373;-5592.513,-2562.353;Inherit;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;375;-5593.222,-2342.823;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;367;-5374.953,-2339.343;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;339;-5298.227,-2858.918;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;344;-6217.095,-1867.774;Float;False;Constant;_5;.5;3;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;316;-5646.027,-1468.785;Inherit;False;Constant;_Float1;Float 1;2;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;387;-6476.193,-1829.535;Inherit;True;Property;_TextureSample2;Texture Sample 2;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;380;-6497.222,-1619.81;Inherit;True;Property;_TextureSample3;Texture Sample 3;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SwizzleNode;382;-6198.09,-1616.144;Inherit;False;FLOAT2;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;330;-6048.87,-1643.519;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;340;-5987.191,-1507.573;Inherit;False;4;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.IntNode;320;-5855.829,-1544.528;Inherit;False;Global;NoiseArraySize;NoiseArraySize;2;0;Create;True;0;0;0;False;0;False;64;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;324;-5809.503,-1430.819;Inherit;False;2;2;0;INT;64;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;317;-5648.343,-1573.256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;322;-5351.278,-1569.994;Inherit;False;2;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;342;-6179.363,-1717.915;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;323;-5884.297,-1712.41;Inherit;False;Property;_Depth;Depth;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;352;-5832.336,-1879.639;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TemplateFragmentDataNode;318;-5365.896,-1845.071;Inherit;False;0;0;vertex;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;366;-5753.52,-1690.974;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;315;-5501.591,-1569.824;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;319;-5360.022,-1759.635;Inherit;False;Global Blue Noise Sample;-1;;60;65496ced1d1d0a041969a9ecf9b0b6ad;0;2;8;FLOAT2;0,0;False;10;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;354;-5411.192,-1862.64;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;321;-5587.984,-1764.452;Inherit;False;Depth Offseting;-1;;61;870d960fa9df7df428c4631082467d83;0;2;1;FLOAT;0;False;10;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;370;-5631.738,-1867.53;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;314;-6005.288,-1349.796;Inherit;False;1;3;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;166;-5024.35,-3017.469;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenPosInputsNode;2;-5025.02,-2829.976;Float;False;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;1;-4825.719,-2927.577;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3;-4832.621,-2823.175;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;89;-4632.424,-2866.359;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;164;-4946.8,-2363.14;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-4794.906,-2186.498;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;96;-4636.808,-2206.398;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ScreenColorNode;65;-4512.308,-2308.198;Float;False;Global;_WaterGrab;WaterGrab;-1;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;88;-3451.545,-99.64278;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;87;-3323.344,-99.24343;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;94;-3199.043,-223.0442;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;13;-3161.038,-134.7599;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;104;-3156.899,-1556.737;Float;False;Property;_WaterSpecular;Water Specular;24;0;Create;True;0;0;0;False;0;False;0;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-3397.168,-1368.048;Float;False;Property;_FoamSpecular;Foam Specular;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;215;-2456.512,-886.0065;Inherit;False;213;_3duvs;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;188;-2003.444,-884.027;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;186;-2003.711,-781.7324;Inherit;False;_displace;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;189;-1872.749,-881.4335;Inherit;False;vertexOffset;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;184;-2000.602,-699.4083;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TFHCRemapNode;182;-1875.374,-696.554;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;399;-4005.305,-2317.03;Inherit;False;212.1862;352.745;;2;231;229;Color;0,0.4875464,1,1;0;0
Node;AmplifyShaderEditor.BlendNormalsNode;325;-3438.198,-1545.07;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldPosInputsNode;207;-3418.101,-728.96;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;210;-2948.396,-931.4036;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;209;-2951.396,-826.4028;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;212;-2809.396,-926.4034;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;213;-2677.396,-927.7664;Inherit;False;_3duvs;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;214;-2673.397,-851.4025;Inherit;False;_Time;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;211;-2829.396,-799.4025;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;327;-4099.005,-961.7555;Float;True;Property;_BumpMap;Normal;0;3;[Header];[NoScaleOffset];[Normal];Create;False;1;Textures;0;0;False;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;378;-6721.559,-1821.608;Float;True;Property;_MotionVectors;Motion Vectors;11;2;[Header];[NoScaleOffset];Create;True;1;Motion Vector UVs (ENABLE ALL TICKS BELOW TO USE);0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FunctionNode;418;-2924.558,-2288.838;Inherit;False;BRDFMap;39;;62;1affaac2d6e57354aaa8d6573a2b32b8;0;1;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;385;-4473.418,-1261.15;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;404;-4048.517,-1339.431;Inherit;False;Property;_SwitchToMotionVectorX;Switch To Motion Vector X;12;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NegateNode;384;-6205.826,-1450.311;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;421;-6188.319,-1329.743;Float;False;Constant;_Float0;Float 0;3;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;420;-6555.931,-1327.633;Inherit;False;Property;_UVMotionIntensity;UV Motion Intensity;18;0;Create;True;0;0;0;False;0;False;1;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CeilOpNode;360;-6489.852,-2694.884;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;422;-6757.933,-2694.788;Inherit;False;Property;_UVMotionSpeed;UV Motion Speed;19;0;Create;True;0;0;0;False;0;False;0.5;0.5;-15;15;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;415;-4584.483,-1107.552;Inherit;False;Property;_NormalIntensity;Normal Intensity;1;1;[Header];Create;True;1;(Non MV ONLY);0;0;False;0;False;0.6;0;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;12;-3616.039,-284.5605;Float;False;Property;_DeepColor;Deep Color;6;2;[HDR];[Header];Create;True;1;Depth Color Blending;0;0;False;0;False;0.01960784,0.003921569,0.4901961,1;0,0.04310164,0.2499982,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;11;-3416.638,-281.3599;Float;False;Property;_ShalowColor;Shalow Color;7;1;[HDR];Create;True;0;0;0;False;0;False;0.4039216,0.03921569,0,1;0,0.8088232,0.8088235,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;424;-3568.521,5.694574;Inherit;False;Property;_DepthColorBlendFalloff;Depth Color Blend Falloff;8;0;Create;True;0;0;0;False;0;False;-1.5;0;-5;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-3616.239,-100.2598;Float;False;Property;_WaterDepth;Water Depth;9;0;Create;True;0;0;0;False;0;False;0.5;0.99;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;329;-5667.323,-1374.042;Inherit;False;Property;_ScaleDepthDither;Scale Depth Dither;20;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;183;-2297.974,-884.887;Inherit;True;Property;_Displacement3DTexture;Displacement 3D Texture;21;1;[Header];Create;True;1;Vertex Displacement Options;0;0;False;0;False;-1;ede26a347e1c6634d9d6c87e30361481;ede26a347e1c6634d9d6c87e30361481;True;0;False;white;LockedToTexture3D;False;Object;-1;Auto;Texture3D;8;0;SAMPLER3D;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;181;-2161.948,-690.2255;Inherit;False;Constant;_Vector0;Vector 0;9;0;Create;True;0;0;0;False;0;False;0,1,0;0,1,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;208;-2974.396,-728.4006;Inherit;False;Property;_WaveSpeed;Wave Speed;25;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;206;-3122.392,-785.7604;Inherit;False;Property;_DisplacementTiling;Displacement Tiling;23;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;179;-2460.355,-695.2172;Inherit;False;Property;_WaveHeight;Wave Height;26;0;Create;True;0;0;0;False;0;False;0.5;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;425;-1893.307,-1048.054;Inherit;False;Property;_UseVertexDisplacementWaves;Use Vertex Displacement (Waves);22;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;115;-4233.522,-308.4329;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;110;-4101.619,-301.8789;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;113;-3959.314,-305.5329;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;225;-3860.029,-126.9508;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;130;-2912.203,-1538.051;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;133;-2906.387,-1386.971;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;108;-3983.494,-2802.316;Float;False;Constant;_Color0;Color 0;-1;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;106;-4456.172,7.272319;Inherit;False;0;105;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;116;-4418.498,-112.6978;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.01,0.01;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;224;-4184.725,-2.093121;Inherit;False;Property;_FoamColor;Foam Color;31;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;114;-3824.735,-286.7234;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;428;-3141.281,-2154.323;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;423;-3172.279,-1383.866;Inherit;False;Property;_WaterSmoothness;Water Smoothness;3;1;[Header];Create;True;1;Water Attributes;0;0;False;0;False;0.8;0.8;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-3167.055,-1304.099;Float;False;Constant;_FoamSmoothness;Foam Smoothness;31;0;Create;True;0;0;0;False;0;False;1;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;117;-3857.976,-2646.113;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;105;-4182.121,-202.7509;Inherit;True;Property;_Foam;Foam;27;1;[Header];Create;True;1;Foam;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;333;-6575.4,-2772.645;Inherit;False;Property;_NormalTilingYMV;Normal Tiling Y (MV);17;0;Create;True;0;0;0;False;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;336;-6410.411,-2632.773;Inherit;False;Property;_NormalTilingXMV;Normal Tiling X (MV);16;0;Create;True;0;0;0;False;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.NoteNode;435;-2599.258,-2659.579;Inherit;False;292;234;Created by Atlas96. Discord: atlas_96;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;431;-4466.296,-207.8023;Inherit;False;Property;_FoamFalloff;Foam Falloff;30;0;Create;True;0;0;0;False;0;False;-10;-10;-20;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;437;-2958.137,-334.6073;Inherit;False;759.6808;544.5923;;7;452;451;448;449;460;461;462;Parallax;1,0.1367925,0.1367925,1;0;0
Node;AmplifyShaderEditor.SamplerNode;328;-3511.319,-1162.968;Inherit;True;Property;_TextureSample6;Texture Sample 1;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;1;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;326;-3603.379,-1414.306;Inherit;True;Property;_TextureSample4;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;402;-4553.864,-1546.568;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.03,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;403;-4556.564,-1416.068;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.04,0.04;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;401;-4764.563,-1517.268;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;419;-4973.573,-1450.065;Inherit;False;Property;_NormalTiling;Normal Tiling;2;1;[Header];Create;True;1;(Non MV ONLY 0.1 Through 1 Recommended);0;0;False;0;False;0.2,0.2;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleAddOpNode;459;-4125.059,-1464.195;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;458;-4123.423,-1557.441;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;456;-4307.703,-1580.336;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;457;-4310.061,-1444.083;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;414;-4227.399,-1235.937;Inherit;False;Property;_SwitchToMotionVectorScaleX;Switch To Motion Vector Scale X;15;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;405;-3869.634,-1543.737;Inherit;False;Property;_SwitchToMotionVectorY;Switch To Motion Vector Y;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;413;-4096.399,-1091.937;Inherit;False;Property;_SwitchToMotionVectorScaleY;Switch To Motion Vector Scale Y;13;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;449;-2936.113,-283.16;Inherit;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TexturePropertyNode;448;-2938.625,-133.6464;Inherit;True;Property;_ParallaxMap;Height Map;33;2;[Header];[NoScaleOffset];Create;False;1;Parallax;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureCoordinatesNode;451;-2725.98,-287.3461;Inherit;False;0;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;429;-4467.173,-300.5872;Inherit;False;Property;_FoamDepth;Foam Depth;29;0;Create;True;0;0;0;False;0;False;1.1;1;0;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;426;-3903.778,-18.04831;Inherit;False;Property;_UseFoam;Use Foam;28;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ParallaxOcclusionMappingNode;452;-2473.975,-212.0245;Inherit;False;0;8;False;;16;False;;2;0.02;0;False;1,1;False;0,0;8;0;FLOAT2;0,0;False;1;SAMPLER2D;;False;7;SAMPLERSTATE;;False;2;FLOAT;0.02;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT2;0,0;False;6;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;460;-2558.596,42.57245;Inherit;False;Property;_UseParallax;Use Parallax;34;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;461;-2730.596,-4.427551;Inherit;False;Constant;_Float2;Float 2;41;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;229;-3992.248,-2273.532;Inherit;False;Property;_WaterColor;Water Color;5;1;[HDR];Create;True;1;Colors;0;0;False;0;False;0.1333333,0.1333333,0.1333333,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;231;-3987.211,-2099.486;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;462;-2906.957,93.69934;Inherit;False;Property;_ParallaxHeightScale;Parallax Height Scale;35;0;Create;True;0;0;0;False;0;False;0;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;463;-4739.044,-2344.459;Inherit;False;True;True;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;93;-3843.5,-2510.619;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;417;-5086.418,-2138.714;Inherit;False;Property;_DistortionIntensity;Distortion Intensity;4;0;Create;True;0;0;0;False;0;False;0.1;0;0;0.7;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;173;-2607.442,-2243.814;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;14;LitMAS Water 2.0;623634af11bd9ab448550ee777f3493e;True;Forward;0;0;Forward;14;False;True;1;1;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;3;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;Lightmode=UniversalForward;True;7;False;0;Hidden/InternalErrorShader;0;0;Standard;24;Workflow;1;0;Surface;1;638630851430817839;Two Sided;0;638629884050422866;Cast Shadows;0;638625370991696133;  Use Shadow Threshold;0;0;GPU Instancing;1;638630934546427872;Built-in Fog;1;0;Lightmaps;1;0;Volumetrics;1;0;Decals;0;0;Write Depth;0;638630934308364846;  Early Z (broken);0;0;Vertex Position,InvertActionOnDeselection;1;0;Emission;1;0;PC Reflection Probe;3;0;PC Receive Shadows;1;0;PC Vertex Lights;0;0;PC SSAO;1;0;Q Reflection Probe;0;0;Q Receive Shadows;0;0;Q Vertex Lights;1;0;Q SSAO;0;0;Environment Reflections;1;0;Meta Pass;1;0;0;5;True;True;True;False;True;False;;False;0
Node;AmplifyShaderEditor.RangedFloatNode;466;-3140.457,-1792.441;Inherit;False;Property;_AlphaClip;Alpha Clip;38;0;Create;True;0;0;0;False;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;467;-2916.217,-1905.195;Inherit;False;Property;_UseAlphaMask;Use Alpha Mask;37;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;465;-3383.457,-2002.441;Inherit;True;Property;_AlphaMask;Alpha Mask;36;1;[Header];Create;True;1;Alpha Masking (INPUT TEXTURE AND SET CLIP AMOUNT TO MORE THAN 0);0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;335;0;367;0
WireConnection;351;0;339;0
WireConnection;361;0;381;0
WireConnection;386;0;387;0
WireConnection;331;0;338;0
WireConnection;369;0;331;0
WireConnection;369;1;333;0
WireConnection;341;0;333;0
WireConnection;346;0;369;0
WireConnection;343;0;346;0
WireConnection;343;1;336;0
WireConnection;363;0;343;0
WireConnection;357;0;363;0
WireConnection;368;0;357;0
WireConnection;368;1;356;0
WireConnection;389;0;369;0
WireConnection;332;0;336;0
WireConnection;356;1;390;0
WireConnection;390;0;336;0
WireConnection;365;0;333;0
WireConnection;365;1;336;0
WireConnection;358;0;360;0
WireConnection;358;1;333;0
WireConnection;348;0;358;0
WireConnection;347;0;348;0
WireConnection;347;1;336;0
WireConnection;377;0;391;0
WireConnection;391;0;358;0
WireConnection;379;1;336;0
WireConnection;350;0;347;0
WireConnection;349;0;350;0
WireConnection;371;0;349;0
WireConnection;371;1;392;0
WireConnection;392;0;379;0
WireConnection;393;0;371;0
WireConnection;394;0;377;0
WireConnection;355;0;389;0
WireConnection;374;0;355;0
WireConnection;374;1;368;0
WireConnection;345;0;367;0
WireConnection;337;0;339;0
WireConnection;381;0;338;0
WireConnection;334;0;422;0
WireConnection;338;0;334;0
WireConnection;373;0;372;0
WireConnection;373;1;365;0
WireConnection;375;0;394;0
WireConnection;375;1;393;0
WireConnection;367;0;373;0
WireConnection;367;1;375;0
WireConnection;339;0;373;0
WireConnection;339;1;374;0
WireConnection;387;0;378;0
WireConnection;387;1;351;0
WireConnection;380;0;378;0
WireConnection;380;1;335;0
WireConnection;382;0;380;0
WireConnection;330;0;382;0
WireConnection;330;1;344;0
WireConnection;340;0;330;0
WireConnection;340;1;342;0
WireConnection;340;2;384;0
WireConnection;340;3;421;0
WireConnection;324;0;320;0
WireConnection;324;1;314;2
WireConnection;317;0;323;0
WireConnection;317;1;314;3
WireConnection;322;0;315;0
WireConnection;322;1;329;0
WireConnection;342;0;361;0
WireConnection;352;0;386;0
WireConnection;352;1;344;0
WireConnection;366;0;352;0
WireConnection;366;1;361;0
WireConnection;366;2;384;0
WireConnection;315;1;316;0
WireConnection;354;0;351;0
WireConnection;354;1;366;0
WireConnection;370;0;335;0
WireConnection;370;1;340;0
WireConnection;1;0;166;0
WireConnection;3;0;1;0
WireConnection;3;1;2;4
WireConnection;89;0;3;0
WireConnection;98;0;325;0
WireConnection;98;1;417;0
WireConnection;96;0;463;0
WireConnection;96;1;98;0
WireConnection;65;0;96;0
WireConnection;88;0;89;0
WireConnection;88;1;6;0
WireConnection;87;0;88;0
WireConnection;87;1;424;0
WireConnection;94;0;87;0
WireConnection;13;0;12;0
WireConnection;13;1;11;0
WireConnection;13;2;94;0
WireConnection;188;0;183;0
WireConnection;188;1;184;0
WireConnection;186;0;183;0
WireConnection;189;0;188;0
WireConnection;184;0;181;0
WireConnection;184;1;182;0
WireConnection;182;0;179;0
WireConnection;325;0;326;0
WireConnection;325;1;328;0
WireConnection;210;0;207;1
WireConnection;210;1;206;0
WireConnection;209;0;207;3
WireConnection;209;1;206;0
WireConnection;212;0;210;0
WireConnection;212;1;209;0
WireConnection;212;2;211;0
WireConnection;213;0;212;0
WireConnection;214;0;211;0
WireConnection;211;0;208;0
WireConnection;385;0;361;0
WireConnection;404;1;457;0
WireConnection;404;0;459;0
WireConnection;384;0;420;0
WireConnection;360;0;338;0
WireConnection;329;1;323;0
WireConnection;329;0;317;0
WireConnection;183;1;215;0
WireConnection;425;0;189;0
WireConnection;115;0;89;0
WireConnection;115;1;429;0
WireConnection;110;0;115;0
WireConnection;110;1;431;0
WireConnection;113;0;110;0
WireConnection;225;0;105;0
WireConnection;225;1;224;0
WireConnection;130;0;104;0
WireConnection;130;1;131;0
WireConnection;130;2;114;0
WireConnection;133;0;423;0
WireConnection;133;1;132;0
WireConnection;133;2;114;0
WireConnection;116;0;106;0
WireConnection;114;0;113;0
WireConnection;114;1;225;0
WireConnection;428;0;231;0
WireConnection;428;1;426;0
WireConnection;117;0;13;0
WireConnection;117;1;108;0
WireConnection;117;2;426;0
WireConnection;105;1;116;0
WireConnection;328;0;327;0
WireConnection;328;1;404;0
WireConnection;328;5;413;0
WireConnection;326;0;327;0
WireConnection;326;1;405;0
WireConnection;326;5;414;0
WireConnection;402;0;401;0
WireConnection;403;0;401;0
WireConnection;401;0;419;0
WireConnection;459;0;452;0
WireConnection;459;1;370;0
WireConnection;458;0;452;0
WireConnection;458;1;354;0
WireConnection;456;0;452;0
WireConnection;456;1;402;0
WireConnection;457;0;452;0
WireConnection;457;1;403;0
WireConnection;414;1;415;0
WireConnection;414;0;385;0
WireConnection;405;1;456;0
WireConnection;405;0;458;0
WireConnection;413;1;415;0
WireConnection;413;0;361;0
WireConnection;426;0;114;0
WireConnection;452;0;451;0
WireConnection;452;1;448;0
WireConnection;452;7;448;1
WireConnection;452;2;460;0
WireConnection;452;3;449;0
WireConnection;460;1;461;0
WireConnection;460;0;462;0
WireConnection;231;0;229;0
WireConnection;231;1;93;0
WireConnection;463;0;164;0
WireConnection;93;0;117;0
WireConnection;93;1;65;0
WireConnection;93;2;94;0
WireConnection;173;0;428;0
WireConnection;173;1;325;0
WireConnection;173;6;133;0
WireConnection;173;8;465;4
WireConnection;173;9;467;0
WireConnection;173;12;425;0
WireConnection;467;0;466;0
ASEEND*/
//CHKSM=3E05F4C70BC712D25C751AE107FF762FEC5F7B7F