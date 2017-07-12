package dFreak.detectJanPai;

import android.content.Context;
import android.content.res.AssetManager;

public class JanPaiDetector {
	static {
		System.loadLibrary("tensorflow_mnist");
	}

	public native int detectJanPai(int[] pixels);

	public boolean setup(Context context) {
		AssetManager assetManager = context.getAssets();

		int ret = init(assetManager, "file:///android_asset/detectJanPai.pb");

		return ret >= 0;
	}



	private native int init(AssetManager assetManager, String model);
}
