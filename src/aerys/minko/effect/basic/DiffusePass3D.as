package aerys.minko.effect.basic
{
	import aerys.minko.effect.IEffect3DPass;
	import aerys.minko.effect.IEffect3DStyle;
	import aerys.minko.render.IRenderer3D;
	import aerys.minko.render.shader.DefaultShader3D;
	import aerys.minko.render.shader.Shader3D;
	import aerys.minko.render.state.Blending;
	import aerys.minko.render.state.RenderState;
	import aerys.minko.type.math.Matrix4x4;
	import aerys.minko.type.vertex.format.PackedVertex3DFormat;
	import aerys.minko.type.vertex.format.Vertex3DFormat;
	
	import flash.display3D.textures.Texture;
	import flash.geom.Matrix3D;
	
	public class DiffusePass3D implements IEffect3DPass
	{
		private static const SHADER	: Shader3D	= new DefaultShader3D();
		
		public function DiffusePass3D()
		{
		}
		
		public function begin(renderer : IRenderer3D, style : IEffect3DStyle) : Boolean
		{
			var state 		: RenderState 	= renderer.state;
			var diffuse		: Texture		= style.get(BasicStyle3D.DIFFUSE_MAP)
											  as Texture;
			var toScreen	: Matrix4x4		= style.get(BasicStyle3D.LOCAL_TO_SCREEN_MATRIX)
											  as Matrix4x4;
			var blending	: uint			= style.get(BasicStyle3D.BLENDING) as uint
											  || Blending.NORMAL;
			
			if (!diffuse)
				return false;
			
			state.shader = SHADER;
			state.blending = blending;
			state.setTextureAt(0, diffuse);
			state.setVertexConstantMatrix(0, toScreen);
			
			return true;
		}
		
		public function end(renderer : IRenderer3D, style : IEffect3DStyle) : void
		{
		}
	}
}