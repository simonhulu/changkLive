package
{
	import flash.display.Sprite;
	import flash.events.NetStatusEvent;
	import flash.media.Camera;
	import flash.media.H264Level;
	import flash.media.H264Profile;
	import flash.media.H264VideoStreamSettings;
	import flash.media.Microphone;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public class changKLive_Publish extends Sprite
	{
		var ns:NetStream;
		var nc:NetConnection = new NetConnection();
		var video:Video = new Video();
		private var startPublish:P
		public function changKLive_Publish()
		{
			nc.connect("rtmp://42.121.121.16/videochat");
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
					var h:H264VideoStreamSettings  = new H264VideoStreamSettings();
					h.setProfileLevel(H264Profile.BASELINE,H264Level.LEVEL_5_1);
					h.setQuality(0,0);
					h.setKeyFrameInterval(15);
					h.setMode(100,100,12);
					ns.bufferTime = 0 ;
					var carme:Camera = Camera.getCamera() ;
					var microphone:Microphone = Microphone.getMicrophone();					
					video.attachCamera(carme);
					ns.videoStreamSettings = h ;
					ns.attachCamera(carme);
					ns.attachAudio(microphone);
					ns.publish("testing",'live');
					ns.client = this;
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