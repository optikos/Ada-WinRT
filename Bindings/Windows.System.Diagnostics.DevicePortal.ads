--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Web.Http;
limited with Windows.ApplicationModel.AppService;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.System.Diagnostics.DevicePortal is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DevicePortalConnectionClosedReason is (
      Unknown,
      ResourceLimitsExceeded,
      ProtocolError,
      NotAuthorized,
      UserNotPresent,
      ServiceTerminated
   );
   for DevicePortalConnectionClosedReason use (
      Unknown => 0,
      ResourceLimitsExceeded => 1,
      ProtocolError => 2,
      NotAuthorized => 3,
      UserNotPresent => 4,
      ServiceTerminated => 5
   );
   for DevicePortalConnectionClosedReason'Size use 32;
   
   type DevicePortalConnectionClosedReason_Ptr is access DevicePortalConnectionClosedReason;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IDevicePortalConnection_add_Closed_Interface;
   type TypedEventHandler_IDevicePortalConnection_add_Closed is access all TypedEventHandler_IDevicePortalConnection_add_Closed_Interface'Class;
   type TypedEventHandler_IDevicePortalConnection_add_Closed_Ptr is access all TypedEventHandler_IDevicePortalConnection_add_Closed;
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface;
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived is access all TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface'Class;
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Ptr is access all TypedEventHandler_IDevicePortalConnection_add_RequestReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDevicePortalConnectionClosedEventArgs_Interface;
   type IDevicePortalConnectionClosedEventArgs is access all IDevicePortalConnectionClosedEventArgs_Interface'Class;
   type IDevicePortalConnectionClosedEventArgs_Ptr is access all IDevicePortalConnectionClosedEventArgs;
   type IDevicePortalConnectionRequestReceivedEventArgs_Interface;
   type IDevicePortalConnectionRequestReceivedEventArgs is access all IDevicePortalConnectionRequestReceivedEventArgs_Interface'Class;
   type IDevicePortalConnectionRequestReceivedEventArgs_Ptr is access all IDevicePortalConnectionRequestReceivedEventArgs;
   type IDevicePortalConnectionStatics_Interface;
   type IDevicePortalConnectionStatics is access all IDevicePortalConnectionStatics_Interface'Class;
   type IDevicePortalConnectionStatics_Ptr is access all IDevicePortalConnectionStatics;
   type IDevicePortalConnection_Interface;
   type IDevicePortalConnection is access all IDevicePortalConnection_Interface'Class;
   type IDevicePortalConnection_Ptr is access all IDevicePortalConnection;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IDevicePortalConnectionClosedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IDevicePortalConnectionClosedEventArgs_Interface
      ; RetVal : access Windows.System.Diagnostics.DevicePortal.DevicePortalConnectionClosedReason
   )
   return Windows.HRESULT is abstract;
   
   IID_IDevicePortalConnectionClosedEventArgs : aliased constant Windows.IID := (4244049464, 28722, 17036, (159, 80, 148, 92, 21, 169, 240, 203 ));
   
   ------------------------------------------------------------------------
   type IDevicePortalConnectionRequestReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestMessage
   (
      This       : access IDevicePortalConnectionRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseMessage
   (
      This       : access IDevicePortalConnectionRequestReceivedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   IID_IDevicePortalConnectionRequestReceivedEventArgs : aliased constant Windows.IID := (1692065861, 28634, 17497, (158, 189, 236, 206, 34, 227, 133, 89 ));
   
   ------------------------------------------------------------------------
   type IDevicePortalConnectionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForAppServiceConnection
   (
      This       : access IDevicePortalConnectionStatics_Interface
      ; appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
      ; RetVal : access Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
   )
   return Windows.HRESULT is abstract;
   
   IID_IDevicePortalConnectionStatics : aliased constant Windows.IID := (1270755815, 59833, 17989, (143, 237, 165, 62, 234, 14, 219, 214 ));
   
   ------------------------------------------------------------------------
   type IDevicePortalConnection_Interface is interface and Windows.IInspectable_Interface;
   
   function add_Closed
   (
      This       : access IDevicePortalConnection_Interface
      ; handler : TypedEventHandler_IDevicePortalConnection_add_Closed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Closed
   (
      This       : access IDevicePortalConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RequestReceived
   (
      This       : access IDevicePortalConnection_Interface
      ; handler : TypedEventHandler_IDevicePortalConnection_add_RequestReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RequestReceived
   (
      This       : access IDevicePortalConnection_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IDevicePortalConnection : aliased constant Windows.IID := (256147281, 4504, 19873, (141, 84, 189, 239, 57, 62, 9, 182 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IDevicePortalConnection_add_Closed_Interface(Callback : access procedure (sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IDevicePortalConnection_add_Closed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePortalConnection_add_Closed_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IDevicePortalConnection_add_Closed : aliased constant Windows.IID := (716018600, 21242, 21683, (149, 86, 21, 214, 81, 32, 139, 63 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface(Callback : access procedure (sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDevicePortalConnection_add_RequestReceived_Interface
      ; sender : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
      ; args : Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IDevicePortalConnection_add_RequestReceived : aliased constant Windows.IID := (3638771704, 35524, 24537, (177, 132, 138, 232, 125, 130, 142, 185 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DevicePortalConnectionClosedEventArgs is Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs;
   subtype DevicePortalConnectionRequestReceivedEventArgs is Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs;
   subtype DevicePortalConnection is Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetForAppServiceConnection
   (
      appServiceConnection : Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection;

end;
