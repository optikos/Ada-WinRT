--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Networking.Connectivity;
with Windows.Devices.Sms;
with Windows.Storage.Streams;
with Windows.Networking;
with Windows.Data.Xml.Dom;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.NetworkOperators is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandCellsInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_INetworkOperatorTetheringOperationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher(sender), Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher(sender), Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher(sender), Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandModemConfiguration
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_MobileBroadbandModemStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_MobileBroadbandModemStatus or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MobileBroadbandModemStatus_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_MobileBroadbandModemStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession(sender), Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandSarManager
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.NetworkOperators.IMobileBroadbandSarManager(sender), Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IHotspotCredentialsAuthenticationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IProvisionFromXmlDocumentResults
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IUssdReply_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IUssdReply or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUssdReply_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IUssdReply
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateNetworkOperatorTetheringAccessPointConfiguration return Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.NetworkOperatorTetheringAccessPointConfiguration");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.NetworkOperators.IID_INetworkOperatorTetheringAccessPointConfiguration'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMobileBroadbandAccountWatcher return Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.MobileBroadbandAccountWatcher");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.NetworkOperators.IID_IMobileBroadbandAccountWatcher'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateProvisioningAgent return Windows.Networking.NetworkOperators.IProvisioningAgent is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.ProvisioningAgent");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IProvisioningAgent := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.NetworkOperators.IID_IProvisioningAgent'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMessage
   (
      messageText : Windows.String
   )
   return Windows.Networking.NetworkOperators.IUssdMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.UssdMessage");
      m_Factory     : Windows.Networking.NetworkOperators.IUssdMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IUssdMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUssdMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMessage(messageText, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_AvailableNetworkAccountIds
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.MobileBroadbandAccount");
      m_Factory     : IMobileBroadbandAccountStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMobileBroadbandAccountStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AvailableNetworkAccountIds(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IMobileBroadbandAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.MobileBroadbandAccount");
      m_Factory     : IMobileBroadbandAccountStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IMobileBroadbandAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMobileBroadbandAccountStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNetworkAccountId(networkAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromConnectionProfileWithTargetAdapter
   (
      profile : Windows.Networking.Connectivity.IConnectionProfile
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
   )
   return Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager");
      m_Factory     : INetworkOperatorTetheringManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkOperatorTetheringManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromConnectionProfileWithTargetAdapter(profile, adapter, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTetheringCapability
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.TetheringCapability is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager");
      m_Factory     : INetworkOperatorTetheringManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.TetheringCapability;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkOperatorTetheringManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTetheringCapability(networkAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager");
      m_Factory     : INetworkOperatorTetheringManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkOperatorTetheringManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNetworkAccountId(networkAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTetheringCapabilityFromConnectionProfile
   (
      profile : Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.Networking.NetworkOperators.TetheringCapability is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager");
      m_Factory     : INetworkOperatorTetheringManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.TetheringCapability;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkOperatorTetheringManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTetheringCapabilityFromConnectionProfile(profile, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromConnectionProfile
   (
      profile : Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager");
      m_Factory     : INetworkOperatorTetheringManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_INetworkOperatorTetheringManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromConnectionProfile(profile, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.MobileBroadbandModem");
      m_Factory     : IMobileBroadbandModemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMobileBroadbandModemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IMobileBroadbandModem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.MobileBroadbandModem");
      m_Factory     : IMobileBroadbandModemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IMobileBroadbandModem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMobileBroadbandModemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Networking.NetworkOperators.IMobileBroadbandModem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.MobileBroadbandModem");
      m_Factory     : IMobileBroadbandModemStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IMobileBroadbandModem;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMobileBroadbandModemStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EFSpn
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownCSimFilePaths");
      m_Factory     : IKnownCSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownCSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EFSpn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid1
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownCSimFilePaths");
      m_Factory     : IKnownCSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownCSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid2
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownCSimFilePaths");
      m_Factory     : IKnownCSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownCSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EFSpn_KnownRuimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownRuimFilePaths");
      m_Factory     : IKnownRuimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRuimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EFSpn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid1_KnownRuimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownRuimFilePaths");
      m_Factory     : IKnownRuimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRuimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid2_KnownRuimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownRuimFilePaths");
      m_Factory     : IKnownRuimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRuimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EFOns
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownSimFilePaths");
      m_Factory     : IKnownSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EFOns(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EFSpn_KnownSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownSimFilePaths");
      m_Factory     : IKnownSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EFSpn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid1_KnownSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownSimFilePaths");
      m_Factory     : IKnownSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid2_KnownSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownSimFilePaths");
      m_Factory     : IKnownSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EFSpn_KnownUSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownUSimFilePaths");
      m_Factory     : IKnownUSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EFSpn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EFOpl
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownUSimFilePaths");
      m_Factory     : IKnownUSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EFOpl(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EFPnn
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownUSimFilePaths");
      m_Factory     : IKnownUSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EFPnn(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid1_KnownUSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownUSimFilePaths");
      m_Factory     : IKnownUSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gid2_KnownUSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.KnownUSimFilePaths");
      m_Factory     : IKnownUSimFilePathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownUSimFilePathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gid2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryGetAuthenticationContext
   (
      evenToken : Windows.String
      ; context : access Windows.Networking.NetworkOperators.IHotspotAuthenticationContext
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.HotspotAuthenticationContext");
      m_Factory     : IHotspotAuthenticationContextStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHotspotAuthenticationContextStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryGetAuthenticationContext(evenToken, context, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IProvisioningAgent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.ProvisioningAgent");
      m_Factory     : IProvisioningAgentStaticMethods := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IProvisioningAgent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProvisioningAgentStaticMethods'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNetworkAccountId(networkAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IUssdSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.UssdSession");
      m_Factory     : IUssdSessionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IUssdSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUssdSessionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNetworkAccountId(networkAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNetworkInterfaceId
   (
      networkInterfaceId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IUssdSession is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.UssdSession");
      m_Factory     : IUssdSessionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.NetworkOperators.IUssdSession;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUssdSessionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNetworkInterfaceId(networkInterfaceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestUnlockAsync
   (
      contactListId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.NetworkOperators.FdnAccessManager");
      m_Factory     : IFdnAccessManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFdnAccessManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestUnlockAsync(contactListId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
