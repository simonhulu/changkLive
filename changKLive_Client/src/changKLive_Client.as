package
{
	
	import com.bit101.components.InputText;
	import com.bit101.components.PushButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.media.Camera;
	import flash.media.H264Level;
	import flash.media.H264Profile;
	import flash.media.H264VideoStreamSettings;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import org.aswing.AsWingManager;
	import org.aswing.JOptionPane;

	public class changKLive_Client extends Sprite
	{
		var ns:NetStream;
		var nc:NetConnection = new NetConnection();
		var video:Video = new Video();		
		private var startPublish:PushButton = new PushButton();
		private var serverName:InputText = new InputText();	
		private var serverPath:String;
		private var streamName:String = '' ;
		private var streamUrl:String = '' ;
		public function changKLive_Client()
		{
			video.width = 450 ;
			video.height = 337 ;		
  AsWingManager.initAsStandard(this);
			addChild(video);
			serverName.width = 460 ;
			serverName.y = 360 ;
			addChild(serverName);
			startPublish.y = 390 ;
			startPublish.label = "Play";
			addChild(startPublish);
			startPublish.addChild(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		
		private function onMouseUp(e:MouseEvent):void
		{
			if (serverPath.indexOf("rtmp") <= 0 || serverPath.length <= 0)
			{
				JOptionPane.showMessageDialog("消息", "地址不对");
			}else {
				 streamUrl = serverPath.slice(0, serverPath.indexOf("?"));
				 streamName = serverPath.substring( serverPath.indexOf("?"));
				receiveStream(streamUrl)
			}
			

		}
		
		private function receiveStream(url):void
		{
			nc.connect(url);
			nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus)			
		}
		

		private function onNetStatus(e:NetStatusEvent):void
		{
			switch(e.info.code)
			{
				case "NetConnection.Connect.Success":
					ns = new NetStream(nc);
					ns.addEventListener(NetStatusEvent.NET_STATUS,onNetStatus);					
					video.attachNetStream(ns);
					ns.play(streamName);
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