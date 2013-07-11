package
{
	
	import flash.display.Sprite;
	import flash.events.NetStatusEvent;
	import flash.media.Camera;
	import flash.media.H264Level;
	import flash.media.H264Profile;
	import flash.media.H264VideoStreamSettings;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	public class changKLive_Client extends Sprite
	{
		var ns:NetStream;
		var nc:NetConnection = new NetConnection();
		var video:Video = new Video();		
		public function changKLive_Client()
		{
			
			nc.connect("rtmp://192.168.9.42/firstmodules");
			nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			addChild(video);		
		}

		private function onNetStatus(e:NetStatusEvent):void
			
		{
			trace(e.info.code);
			switch(e.info.code)
			{
				case "NetConnection.Connect.Success":
					ns = new NetStream(nc);
					ns.addEventListener(NetStatusEvent.NET_STATUS,onNetStatus);					
					video.attachNetStream(ns);
					ns.play('myStream');
					ns.client = new MetaData;
					break;
				case "NetStream.Play.Start":
					
					break;
			}
		}
		
		public function onMetaData(o:*):void
		{
			
		}
				
	}
}