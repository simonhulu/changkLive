package  
{
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author szhang
	 */
	public class MetaData extends EventDispatcher 
	{
		private var _video_Height:Number;
		private var _video_width:Number;
		private var _duration:Number;
		private var _keyFrameFilePositions:Array;
		private var _keyFrameTimes:Array;
		private var _filesize:uint =0;
		private var _data:Object;
		private var _keyFrames:Array  ;
		private var _videoRate:int;
		private static const VIDEO_HEIGHT_TAG_NAME:String   = "height";
		private static const FILE_SIZE_TAG_NAME:String      = "filesize";
		private static const VIDEO_WIDTH_TAG_NAME:String    = "width";
		private static const VIDEO_DURATION_TAG_NAME:String = "duration";
		private static const H264_KEYFRAMES_TAG_NAME:String = "seekpoints";
		private static const FLV_KEYFRAMES_TAG_NAME:String  = "keyframes";
		private static const HAS_AUDIO:String               = "hasAudio";
		private static const HAS_VIDEO:String               = "hasVideo";		
		private static const VIDEODATARATE:String           = 'videodatarate'; 
		public function MetaData() 
		{
			
		}
		
		public function onXMPData(infoObject:Object):void
		{
		}
		
		public function onBWDone(infoObject:Object):void
		{
			
		}
		
		public function onCuePoint(infoObject:Object):void
		{
			
		}
		
		public function onCaption(cps:String, spk:Number):void
		{
			
		}
		
		public function onCaptionInfo(obj:Object):void
		{
			
		}
		
		public function onLastSecond(infoObject:Object):void
		{
			
		}
		
		public function onPlayStatus(infoObject:Object):void
		{
			
		}
		
		public function onImageData(obj:Object):void
		{
			
		}
		
		public function RtmpSampleAccess(obj:Object):void
		{
			
		}
		
		public function onTextData(obj:Object):void
		{
			
		}
		
		public function onMetaData(infoObject:Object):void
		{
			
//			if(_keyFrames ==  null)
//			{
				_data= infoObject; 
				if(data.hasOwnProperty(VIDEO_WIDTH_TAG_NAME))
				{
					_video_width = Number(data[VIDEO_WIDTH_TAG_NAME]);
				}
				if(data.hasOwnProperty(VIDEO_HEIGHT_TAG_NAME))
				{
					_video_Height = Number(data[VIDEO_HEIGHT_TAG_NAME]);
				}
				if(data.hasOwnProperty(VIDEO_DURATION_TAG_NAME))
				{
					_duration = Number(data[VIDEO_DURATION_TAG_NAME]);
				}
				if(data.hasOwnProperty(FILE_SIZE_TAG_NAME))
				{
					_filesize = Math.max(data[FILE_SIZE_TAG_NAME],0);
				}
				if (data.hasOwnProperty(VIDEODATARATE))
				{
					_videoRate = Math.floor(data[VIDEODATARATE]);
				}
				if(data.hasOwnProperty(HAS_AUDIO)&&data.hasOwnProperty(HAS_VIDEO))
				{
					if( data[HAS_AUDIO] == true && data[HAS_VIDEO] == false )
					{
					}
				}
				parseKeyFrames();
				//发送
				//playAfterMetaData();
				//stage.addEventListener(MouseEvent.CLICK,onClick);
//			}
		}

		
		
		
		
		private function parseKeyFrames():void
		{
			
		}
		


		public function get duration():Number
		{
			return _duration;
		}
		
		
		public function get data():Object
		{
			return _data;
		}

		public function get keyFrames():Array
		{
			return _keyFrames;
		}

		public function get filesize():uint
		{
			return _filesize;
		}


		public function get video_Height():Number
		{
			return _video_Height;
		}

		public function get video_width():Number
		{
			return _video_width;
		}
		
		public function get videoRate():int 
		{
			return _videoRate;
		}

		public function resetData():void
		{
			_video_width = 0;
			_video_Height = 0;
			_duration = 0;
			_filesize = 0;
			_keyFrames = null;
		}
		
		
	}
}
class Enforce
{
	
}