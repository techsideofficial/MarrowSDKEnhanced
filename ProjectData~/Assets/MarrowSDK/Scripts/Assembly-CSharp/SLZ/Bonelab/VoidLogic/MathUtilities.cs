using System.Runtime.CompilerServices;

namespace SLZ.Bonelab.VoidLogic
{
	internal static class MathUtilities
	{
		[MethodImpl(256)]
		public static bool IsApproximatelyEqualToOrGreaterThan(this float num1, float num2)
		{
			return num1 >= num2;
		}

		[MethodImpl(256)]
		public static bool IsApproximatelyEqualToOrLessThan(this float num1, float num2)
		{
			return num1 <= num2;
		}
	}
}
