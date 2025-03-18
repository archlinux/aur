-- This file is part of VulkAda.

-- VulkAda is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.

-- VulkAda is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with VulkAda.
-- If not, see <http://www.gnu.org/licenses/>.

-- Copyright 2025 Phaser Cat Games LLC

-- C interface to the surface protected capabilities extension

with Vulkan.Utilities;
with Vulkan.Extension_Records;

package body Vulkan.Extensions.KHR_Surface_Protected_Capabilities_C is
    function To_C(Struct: in KHR.Surface_Protected_Capabilities)
        return Surface_Protected_Capabilities_C is
        SPCC: Surface_Protected_Capabilities_C;
    begin
        SPCC.Next := Extension_Records.To_C(Struct.Next);
        SPCC.Supports_Protected := Utilities.To_C(Struct.Supports_Protected);

        return SPCC;
    end To_C;

    procedure Free(Struct: in out Surface_Protected_Capabilities_C) is
    begin
        Extension_Records.Free(Struct.Next);
    end Free;

    function To_C(Next: in In_Structure_Access)
        return C.In_Structure_C_Access is
    begin
        if Next = null then
            return null;
        end if;

        case Structure(Next.Record_Type) is
            when Surface_Protected_Capabilities_Type =>
                declare
                    function Make_Struct is new Utilities.Make_In_Struct
                        (KHR.Surface_Protected_Capabilities,
                         Surface_Protected_Capabilities_C,
                         Surface_Protected_Capabilities_C_Access);
                begin
                    return Make_Struct(Next);
                end;
        end case;
    end To_C;

    procedure Free(Next: in out C.In_Structure_C_Access) is
        use type C.In_Structure_C_Access;
    begin
        if Next = null then
            return;
        end if;

        case Structure(Next.Record_Type) is
            when Surface_Protected_Capabilities_Type =>
                declare
                    procedure Free_Struct is new Utilities.Free_In_Struct
                        (Surface_Protected_Capabilities_C,
                         Surface_Protected_Capabilities_C_Access);
                begin
                    Free_Struct(Next);
                end;
        end case;
    end Free;
end Vulkan.Extensions.KHR_Surface_Protected_Capabilities_C;

