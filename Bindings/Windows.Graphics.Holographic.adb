--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Graphics.DirectX.Direct3D11;
with Windows.UI.Core;
with Windows.Perception.Spatial;
with Windows.Perception;
with Windows.Graphics.DirectX;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Holographic is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IHolographicSpace_add_CameraAdded or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface
      ; sender : Windows.Graphics.Holographic.IHolographicSpace
      ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Holographic.IHolographicSpace(sender), Windows.Graphics.Holographic.IHolographicSpaceCameraAddedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IHolographicSpace_add_CameraRemoved or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface
      ; sender : Windows.Graphics.Holographic.IHolographicSpace
      ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Holographic.IHolographicSpace(sender), Windows.Graphics.Holographic.IHolographicSpaceCameraRemovedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      size : Windows.Foundation.Size
   )
   return Windows.Graphics.Holographic.IHolographicQuadLayer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicQuadLayer");
      m_Factory     : Windows.Graphics.Holographic.IHolographicQuadLayerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicQuadLayer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicQuadLayerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(size, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPixelFormat
   (
      size : Windows.Foundation.Size
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.Graphics.Holographic.IHolographicQuadLayer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicQuadLayer");
      m_Factory     : Windows.Graphics.Holographic.IHolographicQuadLayerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicQuadLayer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicQuadLayerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPixelFormat(size, pixelFormat, RetVal'Access);
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
   
   
   function CreateForCoreWindow
   (
      window : Windows.UI.Core.ICoreWindow
   )
   return Windows.Graphics.Holographic.IHolographicSpace is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicSpace;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForCoreWindow(window, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsConfigured
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsConfigured(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsAvailable
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsAvailable(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_IsAvailableChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_IsAvailableChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_IsAvailableChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_IsAvailableChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetDefault
   return Windows.Graphics.Holographic.IHolographicDisplay is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicDisplay");
      m_Factory     : IHolographicDisplayStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicDisplay;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicDisplayStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
