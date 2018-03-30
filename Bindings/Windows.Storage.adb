--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.System;
with Windows.Storage.FileProperties;
with Windows.Storage.Search;
with Windows.Storage.Streams;
with Windows.Storage.Provider;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Storage is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access StreamedFileDataRequestedHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_StreamedFileDataRequestedHandler or riid.all = IID_IUnknown then
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
      This       : access StreamedFileDataRequestedHandler_Interface
      ; stream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.Streams.IOutputStream(stream));
      return Hr;
   end;
   
   function QueryInterface(This : access ApplicationDataSetVersionHandler_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_ApplicationDataSetVersionHandler or riid.all = IID_IUnknown then
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
      This       : access ApplicationDataSetVersionHandler_Interface
      ; setVersionRequest : Windows.Storage.ISetVersionRequest
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.ISetVersionRequest(setVersionRequest));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IStorageLibrary_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IStorageLibrary or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IStorageLibrary_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageLibrary
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IStorageFolder_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IStorageFolder or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IStorageFolder_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageFolder
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access VectorChangedEventHandler_IStorageFolder_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_VectorChangedEventHandler_IStorageFolder or riid.all = IID_IUnknown then
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
      This       : access VectorChangedEventHandler_IStorageFolder_Interface
      ; sender : Windows.Storage.IObservableVector_IStorageFolder
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, event);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IStorageLibrary_add_DefinitionChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IStorageLibrary_add_DefinitionChanged_Interface
      ; sender : Windows.Storage.IStorageLibrary
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.IStorageLibrary(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IStorageFile_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IStorageFile or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IStorageFile_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageFile
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IStorageItem_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IStorageItem or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IStorageItem_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageItem
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IStorageStreamTransaction_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IStorageStreamTransaction or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IStorageStreamTransaction_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IStorageStreamTransaction
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IApplicationData_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IApplicationData or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IApplicationData_Interface
      ; asyncInfo : Windows.Storage.IAsyncOperation_IApplicationData
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IApplicationData_add_DataChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IApplicationData_add_DataChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IApplicationData_add_DataChanged_Interface
      ; sender : Windows.Storage.IApplicationData
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Storage.IApplicationData(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateApplicationDataCompositeValue return Windows.Foundation.Collections.IPropertySet is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.ApplicationDataCompositeValue");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IPropertySet := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Collections.IID_IPropertySet'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function GetLibraryAsync
   (
      libraryId : Windows.Storage.KnownLibraryId
   )
   return Windows.Storage.IAsyncOperation_IStorageLibrary is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageLibrary");
      m_Factory     : IStorageLibraryStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageLibrary;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageLibraryStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLibraryAsync(libraryId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLibraryForUserAsync
   (
      user : Windows.System.IUser
      ; libraryId : Windows.Storage.KnownLibraryId
   )
   return Windows.Storage.IAsyncOperation_IStorageLibrary is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageLibrary");
      m_Factory     : IStorageLibraryStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageLibrary;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageLibraryStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLibraryForUserAsync(user, libraryId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFolderFromPathAsync
   (
      path : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageFolder");
      m_Factory     : IStorageFolderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageFolderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFolderFromPathAsync(path, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Objects3D
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Objects3D(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AppCaptures
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AppCaptures(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RecordedCalls
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RecordedCalls(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MusicLibrary
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MusicLibrary(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PicturesLibrary
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PicturesLibrary(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VideosLibrary
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VideosLibrary(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DocumentsLibrary
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DocumentsLibrary(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HomeGroup
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HomeGroup(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RemovableDevices
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RemovableDevices(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MediaServerDevices
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MediaServerDevices(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CameraRoll
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersCameraRollStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersCameraRollStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CameraRoll(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SavedPictures
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersSavedPicturesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersSavedPicturesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SavedPictures(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFolderForUserAsync
   (
      user : Windows.System.IUser
      ; folderId : Windows.Storage.KnownFolderId
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFolderForUserAsync(user, folderId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Playlists
   return Windows.Storage.IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.KnownFolders");
      m_Factory     : IKnownFoldersPlaylistsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownFoldersPlaylistsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Playlists(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Storage.IUserDataPaths is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.UserDataPaths");
      m_Factory     : IUserDataPathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IUserDataPaths;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDataPathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Storage.IUserDataPaths is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.UserDataPaths");
      m_Factory     : IUserDataPathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IUserDataPaths;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserDataPathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Storage.IAppDataPaths is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.AppDataPaths");
      m_Factory     : IAppDataPathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAppDataPaths;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDataPathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Storage.IAppDataPaths is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.AppDataPaths");
      m_Factory     : IAppDataPathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAppDataPaths;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppDataPathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Storage.ISystemDataPaths is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemDataPaths");
      m_Factory     : ISystemDataPathsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemDataPaths;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemDataPathsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFileFromPathAsync
   (
      path : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageFile");
      m_Factory     : IStorageFileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageFileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFileFromPathAsync(path, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFileFromApplicationUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageFile");
      m_Factory     : IStorageFileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageFileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFileFromApplicationUriAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStreamedFileAsync
   (
      displayNameWithExtension : Windows.String
      ; dataRequested : Windows.Storage.StreamedFileDataRequestedHandler
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageFile");
      m_Factory     : IStorageFileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageFileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateStreamedFileAsync(displayNameWithExtension, dataRequested, thumbnail, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReplaceWithStreamedFileAsync
   (
      fileToReplace : Windows.Storage.IStorageFile
      ; dataRequested : Windows.Storage.StreamedFileDataRequestedHandler
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageFile");
      m_Factory     : IStorageFileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageFileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReplaceWithStreamedFileAsync(fileToReplace, dataRequested, thumbnail, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateStreamedFileFromUriAsync
   (
      displayNameWithExtension : Windows.String
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageFile");
      m_Factory     : IStorageFileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageFileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateStreamedFileFromUriAsync(displayNameWithExtension, uri, thumbnail, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReplaceWithStreamedFileFromUriAsync
   (
      fileToReplace : Windows.Storage.IStorageFile
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; thumbnail : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.StorageFile");
      m_Factory     : IStorageFileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStorageFileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReplaceWithStreamedFileFromUriAsync(fileToReplace, uri, thumbnail, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFileForUserAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFileForUserAsync(user, desiredName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFolderForUserAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFolderForUserAsync(user, desiredName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFileForUserWithCollisionOptionAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFileForUserWithCollisionOptionAsync(user, desiredName, option, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFolderForUserWithCollisionOptionAsync
   (
      user : Windows.System.IUser
      ; desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFolderForUserWithCollisionOptionAsync(user, desiredName, option, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFileAsync
   (
      desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFileAsync(desiredName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFolderAsync
   (
      desiredName : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFolderAsync(desiredName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFileWithCollisionOptionAsync
   (
      desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFileWithCollisionOptionAsync(desiredName, option, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFolderWithCollisionOptionAsync
   (
      desiredName : Windows.String
      ; option : Windows.Storage.CreationCollisionOption
   )
   return Windows.Storage.IAsyncOperation_IStorageFolder is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.DownloadsFolder");
      m_Factory     : IDownloadsFolderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFolder;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDownloadsFolderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFolderWithCollisionOptionAsync(desiredName, option, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadTextAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadTextAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadTextWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadTextWithEncodingAsync(file, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteTextAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteTextAsync(file, contents, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteTextWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteTextWithEncodingAsync(file, contents, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendTextAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendTextAsync(file, contents, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendTextWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendTextWithEncodingAsync(file, contents, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadLinesAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadLinesAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadLinesWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadLinesWithEncodingAsync(file, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteLinesAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteLinesAsync(file, lines, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteLinesWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteLinesWithEncodingAsync(file, lines, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendLinesAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendLinesAsync(file, lines, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendLinesWithEncodingAsync
   (
      file : Windows.Storage.IStorageFile
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendLinesWithEncodingAsync(file, lines, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadBufferAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadBufferAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteBufferAsync
   (
      file : Windows.Storage.IStorageFile
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteBufferAsync(file, buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteBytesAsync
   (
      file : Windows.Storage.IStorageFile
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.FileIO");
      m_Factory     : IFileIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteBytesAsync(file, buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadTextAsync
   (
      absolutePath : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadTextAsync(absolutePath, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadTextWithEncodingAsync
   (
      absolutePath : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadTextWithEncodingAsync(absolutePath, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteTextAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteTextAsync(absolutePath, contents, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteTextWithEncodingAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteTextWithEncodingAsync(absolutePath, contents, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendTextAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendTextAsync(absolutePath, contents, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendTextWithEncodingAsync
   (
      absolutePath : Windows.String
      ; contents : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendTextWithEncodingAsync(absolutePath, contents, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadLinesAsync
   (
      absolutePath : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadLinesAsync(absolutePath, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadLinesWithEncodingAsync
   (
      absolutePath : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadLinesWithEncodingAsync(absolutePath, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteLinesAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteLinesAsync(absolutePath, lines, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteLinesWithEncodingAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteLinesWithEncodingAsync(absolutePath, lines, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendLinesAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendLinesAsync(absolutePath, lines, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AppendLinesWithEncodingAsync
   (
      absolutePath : Windows.String
      ; lines : Windows.Foundation.Collections.IIterable_String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AppendLinesWithEncodingAsync(absolutePath, lines, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ReadBufferAsync
   (
      absolutePath : Windows.String
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ReadBufferAsync(absolutePath, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteBufferAsync
   (
      absolutePath : Windows.String
      ; buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteBufferAsync(absolutePath, buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function WriteBytesAsync
   (
      absolutePath : Windows.String
      ; buffer : Windows.UInt8_Ptr
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.PathIO");
      m_Factory     : IPathIOStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPathIOStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.WriteBytesAsync(absolutePath, buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure DeferUpdates
   (
      file : Windows.Storage.IStorageFile
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.CachedFileManager");
      m_Factory     : ICachedFileManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICachedFileManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeferUpdates(file);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CompleteUpdatesAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Storage.Provider.IAsyncOperation_FileUpdateStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.CachedFileManager");
      m_Factory     : ICachedFileManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Provider.IAsyncOperation_FileUpdateStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICachedFileManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CompleteUpdatesAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Author
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Author(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Comment
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Comment(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ItemNameDisplay
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemNameDisplay(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Keywords
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Keywords(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rating
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rating(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Title
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Title(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Audio
   return Windows.Storage.ISystemAudioProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemAudioProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Audio(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GPS
   return Windows.Storage.ISystemGPSProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemGPSProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GPS(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Media
   return Windows.Storage.ISystemMediaProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemMediaProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Media(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Music
   return Windows.Storage.ISystemMusicProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemMusicProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Music(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Photo
   return Windows.Storage.ISystemPhotoProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemPhotoProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Photo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Video
   return Windows.Storage.ISystemVideoProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemVideoProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Video(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Image
   return Windows.Storage.ISystemImageProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.SystemProperties");
      m_Factory     : ISystemProperties := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.ISystemImageProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemProperties'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Image(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Current
   return Windows.Storage.IApplicationData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.ApplicationData");
      m_Factory     : IApplicationDataStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IApplicationData;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationDataStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUserAsync
   (
      user : Windows.System.IUser
   )
   return Windows.Storage.IAsyncOperation_IApplicationData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Storage.ApplicationData");
      m_Factory     : IApplicationDataStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IApplicationData;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IApplicationDataStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUserAsync(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
