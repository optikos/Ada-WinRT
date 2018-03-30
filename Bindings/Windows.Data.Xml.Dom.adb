--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Data.Xml.Dom is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IXmlDocument_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IXmlDocument or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IXmlDocument_Interface
      ; asyncInfo : Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument
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
   
   
   function CreateXmlDocument return Windows.Data.Xml.Dom.IXmlDocument is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IXmlDocument := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Xml.Dom.IID_IXmlDocument'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateXmlLoadSettings return Windows.Data.Xml.Dom.IXmlLoadSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlLoadSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IXmlLoadSettings := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Xml.Dom.IID_IXmlLoadSettings'Access, RetVal'Address);
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
   
   
   function LoadFromUriAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromUriAsync(uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromUriWithSettingsAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromUriWithSettingsAsync(uri, loadSettings, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromFileWithSettingsAsync
   (
      file : Windows.Storage.IStorageFile
      ; loadSettings : Windows.Data.Xml.Dom.IXmlLoadSettings
   )
   return Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Xml.Dom.XmlDocument");
      m_Factory     : IXmlDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Xml.Dom.IAsyncOperation_IXmlDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXmlDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileWithSettingsAsync(file, loadSettings, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
