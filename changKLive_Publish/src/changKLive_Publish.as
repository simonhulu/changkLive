package
{
	import com.bit101.components.InputText;
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.bit101.components.Style;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.media.Camera;
	import org.aswing.AsWingManager;
	import org.aswing.Component;
	import org.aswing.event.AWEvent;
	import org.aswing.FlowLayout;
	import org.aswing.JButton;
	import org.aswing.JFrame;
	import org.aswing.JOptionPane;
	//import flash.media.H264Level;
	//import flash.media.H264Profile;
	//import flash.media.H264VideoStreamSettings;
	import flash.media.Microphone;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;		
	public class changKLive_Publish extends Sprite
	{

		var ns:NetStream;
		var nc:NetConnection = new NetConnection();
		var video:Video = new Video();
		private var startPublish:PushButton = new PushButton();
		private var serverName:InputText = new InputText();
		private var serveraddress:Label = new Label();
		private var publishaddress:String = "rtmp://42.121.121.16/videochat";	

  private var myFrame:JFrame;
    private var myButton:JButton;
	
		public function changKLive_Publish()
		{
			
  AsWingManager.initAsStandard(this);
			
		
    AsWingManager.initAsStandard(this);
AsWingManager.setRoot(this);
			addChild(video);	
			video.width = 450 ;
			video.height = 337 ;
			
			startPublish.label = "开始直播";
			
			addChild(startPublish);
			
			addChild(serverName);
			
			
			serveraddress.text = "直播地址";
			addChild(serveraddress);
			startPublish.x = 60 ;
			startPublish.y = 350 ;
			serveraddress.y = 390 ;
			serverName.width = 460 ;
			serverName.height = 30 ;
			serverName.x = serveraddress.width + 101 ;
			serverName.y = 395 ;
			startPublish.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		}
	
		private function __buttonClicked(e:AWEvent):void {
			JOptionPane.showMessageDialog("Hello", "Hello, World!");
		}		
		
		private function onMouseUp(e:MouseEvent):void
		{
			if (startPublish.label = "开始直播")
			{
				startPublishStream();
				startPublish.label = "停止直播";
			}else {
				 stopPublish()
					startPublish.label = "开始直播";			
			}
		}
		
		
		private function startPublishStream():void
		{
			nc.connect(publishaddress);
			nc.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);			
		}
		
		
		private function stopPublish():void
		{
			
		}
		
		private function onNetStatus(e:NetStatusEvent):void
			
		{
			trace(e.info.code);
			switch(e.info.code)
			{
				case "NetConnection.Connect.Success":
					ns = new NetStream(nc);
					ns.addEventListener(NetStatusEvent.NET_STATUS,onNetStatus);					
					//var h:H264VideoStreamSettings  = new H264VideoStreamSettings();
					//h.setProfileLevel(H264Profile.BASELINE,H264Level.LEVEL_5_1);
					//h.setQuality(0,0);
					//h.setKeyFrameInterval(15);
					//h.setMode(100,100,12);
					ns.bufferTime = 0 ;
					var carme:Camera = Camera.getCamera() ;
					
					if (carme.name.length<=0)
					{
									JOptionPane.showMessageDialog("消息", "没有找到摄像头");	
					}
					var microphone:Microphone = Microphone.getMicrophone();					
					video.attachCamera(carme);
					//ns.videoStreamSettings = h ;
					ns.attachCamera(carme);
					ns.attachAudio(microphone);
					var token:String = Math.random() * 10000 + Math.random() * 10000+'';
					serverName.text = publishaddress + "/?token" + token;
					ns.publish(token,'live');
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