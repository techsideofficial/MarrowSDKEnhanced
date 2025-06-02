using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using SLZ.Marrow.VoidLogic;
using UnityEngine;

namespace SLZ.Bonelab.VoidLogic
{
	[Support(SupportFlags.NotForRelease, "This is a one-off for testing.")]
	[AddComponentMenu(null)]
	public sealed class OneOffSetEuler : MonoBehaviour, IVoidLogicSink, IVoidLogicNode, IVoidLogicActuator
	{
		public VoidLogicSubgraph Subgraph
		{
			[CompilerGenerated]
			get
			{
				return null;
			}
			[CompilerGenerated]
			set
			{
			}
		}

		public bool Deprecated
		{
			get
			{
				return default(bool);
			}
		}

		private void Awake()
		{
		}

		private void OnEnable()
		{
		}

		private void OnDisable()
		{
		}

		private void OnDestroy()
		{
		}

		private void Update()
		{
		}

		void IVoidLogicNode.Initialize(NodeState nodeState)
		{
		}

		public void Actuate(NodeState nodeState)
		{
		}

		public int InputCount
		{
			get
			{
				return 0;
			}
		}

		public bool TryGetInputConnection(uint inputIndex, [Out] OutputPortReference connectedPort)
		{
			return default(bool);
		}

		public bool TryConnectPortToInput(OutputPortReference output, uint inputIndex)
		{
			return default(bool);
		}

		PortMetadata IVoidLogicNode.PortMetadata
		{
			get
			{
				return default(PortMetadata);
			}
		}

		public OneOffSetEuler()
		{
		}

		[SerializeField]
		[HideInInspector]
		private bool _deprecated;

		[Tooltip("Dead Field: Please remove")]
		[NonReorderable]
		[Obsolete("Dead Field: Please remove")]
		[SerializeField]
		protected internal MonoBehaviour[] _previous;

		[SerializeField]
		[NonReorderable]
		[Tooltip("Previous node(s) in the chain")]
		protected internal OutputPortReference[] _previousConnections;

		[SerializeField]
		private bool _setOnActuation;

		[SerializeField]
		private Transform _target;

		private Vector3 targetRotation;

		private static readonly PortMetadata _portMetadata;
	}
}
