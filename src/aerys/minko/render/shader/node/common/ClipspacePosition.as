package aerys.minko.render.shader.node.common
{
	import aerys.minko.render.shader.node.Dummy;
	import aerys.minko.render.shader.node.INode;
	import aerys.minko.render.shader.node.IVertexNode;
	import aerys.minko.render.shader.node.leaf.Attribute;
	import aerys.minko.render.shader.node.leaf.TransformParameter;
	import aerys.minko.render.shader.node.operation.builtin.Multiply4x4;
	import aerys.minko.render.shader.node.operation.manipulation.Interpolate;
	import aerys.minko.scene.visitor.data.LocalData;
	import aerys.minko.type.vertex.format.VertexComponent;
	
	public class ClipspacePosition extends Dummy implements IVertexNode
	{
		public function get interpolated() : INode
		{
			return new Interpolate(this);
		}
		
		public function ClipspacePosition()
		{
			var result : INode = new Multiply4x4(
				new Attribute(VertexComponent.XYZ),
				new TransformParameter(16, LocalData.LOCAL_TO_SCREEN)
			);
			
			super(result);
		}
	}
}