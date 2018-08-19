--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Display is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access DisplayPropertiesEventHandler_Interface
      ; sender : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayInformation(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_OrientationChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayInformation(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_DpiChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayInformation(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_StereoEnabledChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayInformation(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation_add_ColorProfileChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayInformation(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayInformation5_add_AdvancedColorInfoChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayInformation
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayInformation(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_IsSupportedChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IBrightnessOverride(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_IsOverrideActiveChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IBrightnessOverride(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IBrightnessOverride_add_BrightnessLevelChanged_Interface
      ; sender : Windows.Graphics.Display.IBrightnessOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IBrightnessOverride(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayEnhancementOverride_add_CanOverrideChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayEnhancementOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayEnhancementOverride(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayEnhancementOverride_add_IsOverrideActiveChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayEnhancementOverride
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayEnhancementOverride(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDisplayEnhancementOverride_add_DisplayEnhancementOverrideCapabilitiesChanged_Interface
      ; sender : Windows.Graphics.Display.IDisplayEnhancementOverride
      ; args : Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilitiesChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Display.IDisplayEnhancementOverride(sender), Windows.Graphics.Display.IDisplayEnhancementOverrideCapabilitiesChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Graphics.Display.IDisplayInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayInformation");
      m_Factory     : IDisplayInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IDisplayInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AutoRotationPreferences
   return Windows.Graphics.Display.DisplayOrientations is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayInformation");
      m_Factory     : IDisplayInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.DisplayOrientations;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutoRotationPreferences(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AutoRotationPreferences
   (
      value : Windows.Graphics.Display.DisplayOrientations
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayInformation");
      m_Factory     : IDisplayInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AutoRotationPreferences(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_DisplayContentsInvalidated
   (
      handler : TypedEventHandler_IDisplayInformationStatics_add_DisplayContentsInvalidated
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayInformation");
      m_Factory     : IDisplayInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_DisplayContentsInvalidated(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_DisplayContentsInvalidated
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayInformation");
      m_Factory     : IDisplayInformationStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayInformationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_DisplayContentsInvalidated(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_CurrentOrientation
   return Windows.Graphics.Display.DisplayOrientations is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.DisplayOrientations;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CurrentOrientation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NativeOrientation
   return Windows.Graphics.Display.DisplayOrientations is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.DisplayOrientations;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NativeOrientation(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AutoRotationPreferences_DisplayProperties
   return Windows.Graphics.Display.DisplayOrientations is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.DisplayOrientations;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutoRotationPreferences(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AutoRotationPreferences_DisplayProperties
   (
      value : Windows.Graphics.Display.DisplayOrientations
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AutoRotationPreferences(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_OrientationChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_OrientationChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_OrientationChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_OrientationChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ResolutionScale
   return Windows.Graphics.Display.ResolutionScale is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.ResolutionScale;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ResolutionScale(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LogicalDpi
   return Windows.Single is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Single;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LogicalDpi(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_LogicalDpiChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_LogicalDpiChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_LogicalDpiChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_LogicalDpiChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_StereoEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StereoEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_StereoEnabledChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_StereoEnabledChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_StereoEnabledChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_StereoEnabledChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetColorProfileAsync
   return Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IRandomAccessStream;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetColorProfileAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_ColorProfileChanged
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ColorProfileChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ColorProfileChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ColorProfileChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_DisplayContentsInvalidated
   (
      handler : Windows.Graphics.Display.DisplayPropertiesEventHandler
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_DisplayContentsInvalidated(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_DisplayContentsInvalidated_DisplayProperties
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayProperties");
      m_Factory     : IDisplayPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_DisplayContentsInvalidated(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetDefaultForSystem
   return Windows.Graphics.Display.IBrightnessOverride is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.BrightnessOverride");
      m_Factory     : IBrightnessOverrideStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IBrightnessOverride;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBrightnessOverrideStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultForSystem(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.Graphics.Display.IBrightnessOverride is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.BrightnessOverride");
      m_Factory     : IBrightnessOverrideStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IBrightnessOverride;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBrightnessOverrideStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SaveForSystemAsync
   (
      value : Windows.Graphics.Display.IBrightnessOverride
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.BrightnessOverride");
      m_Factory     : IBrightnessOverrideStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBrightnessOverrideStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SaveForSystemAsync(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromLevel
   (
      level : Windows.Double
   )
   return Windows.Graphics.Display.IBrightnessOverrideSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.BrightnessOverrideSettings");
      m_Factory     : IBrightnessOverrideSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IBrightnessOverrideSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBrightnessOverrideSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromLevel(level, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromNits
   (
      nits : Windows.Single
   )
   return Windows.Graphics.Display.IBrightnessOverrideSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.BrightnessOverrideSettings");
      m_Factory     : IBrightnessOverrideSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IBrightnessOverrideSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBrightnessOverrideSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromNits(nits, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDisplayBrightnessOverrideScenario
   (
      overrideScenario : Windows.Graphics.Display.DisplayBrightnessOverrideScenario
   )
   return Windows.Graphics.Display.IBrightnessOverrideSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.BrightnessOverrideSettings");
      m_Factory     : IBrightnessOverrideSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IBrightnessOverrideSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBrightnessOverrideSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDisplayBrightnessOverrideScenario(overrideScenario, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDisplayColorOverrideScenario
   (
      overrideScenario : Windows.Graphics.Display.DisplayColorOverrideScenario
   )
   return Windows.Graphics.Display.IColorOverrideSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.ColorOverrideSettings");
      m_Factory     : IColorOverrideSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IColorOverrideSettings;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IColorOverrideSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDisplayColorOverrideScenario(overrideScenario, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.Graphics.Display.IDisplayEnhancementOverride is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Display.DisplayEnhancementOverride");
      m_Factory     : IDisplayEnhancementOverrideStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Display.IDisplayEnhancementOverride;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDisplayEnhancementOverrideStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
