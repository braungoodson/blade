package {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Video;
	public class Blade extends Sprite {
		public function Blade () {
			var blade:TextField = new TextField();
			blade.appendText("blade");
			blade.autoSize = TextFieldAutoSize.CENTER;
			this.addChild(blade);
			var videoConnection:NetConnection = new NetConnection();
			videoConnection.connect(null);
			var videoStream:NetStream = new NetStream(videoConnection);
			var video:Video = new Video();
			this.addChild(video);
			var client:Object = new Object();
			client.onMetaData = this.onMetaData;
			videoStream.client = client;
			video.attachNetStream(videoStream);
			videoStream.play("video-001.mp4");
		}
		private function onMetaData (data:Object) : void {
			
		}
	}
}