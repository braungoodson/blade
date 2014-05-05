package {

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Video;
	import flash.display.StageScaleMode;

	public class Blade extends Sprite {

		public function Blade () {
			this.printLogo(this);
		}

		private function printLogo (container:Sprite) : void {
			var textFormat:TextFormat = new TextFormat();
			textFormat.color = 0x000000;
			textFormat.size = 50;
			textFormat.bold = true;
			var blade:TextField = new TextField();
			blade.appendText("blade");
			blade.setTextFormat(textFormat);
			blade.width = 120;
			blade.height = 50;
			blade.x = 600/2-60;
			blade.y = 340/2-25;
			container.addChild(blade);
		}

		private function videoFactory (videoEndpoint:String,videoHeight:int,videoWidth:int) : void {
			var videoConnection:NetConnection = new NetConnection();
			videoConnection.connect(null);
			var videoStream:NetStream = new NetStream(videoConnection);
			var video:Video = new Video();
			//this.height = videoHeight;
			//this.width = videoWidth;
			this.addChild(video);
			var client:Object = new Object();
			client.onMetaData = this.onMetaData;
			videoStream.client = client;

			video.attachNetStream(videoStream);
			videoStream.play(videoEndpoint);
		}

		private function onMetaData (data:Object) : void {	
		}

	}
}