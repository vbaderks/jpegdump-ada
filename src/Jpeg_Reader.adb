-- Copyright (c) Victor Derks.
-- SPDX-License-Identifier: MIT

with Ada.Streams.Stream_IO;
with Ada.Streams; use Ada.Streams;
with Ada.Text_IO; use Ada.Text_IO;

package body Jpeg_Reader is

   procedure Dump_Marker (MarkerCode : Integer);

   type Marker is (StartOfImage, EndOfImage, StartOfScan);

    for Marker use
       (StartOfImage => 16#D8#,
       EndOfImage   => 16#D9#,
       StartOfScan  => 16#DA#);

   procedure Dump_Segments (File : Ada.Streams.Stream_IO.File_Type) is
      Buffer : Ada.Streams.Stream_Element_Array(1 .. 2);
      Last   : Ada.Streams.Stream_Element_Offset;
   begin
      loop
         Ada.Streams.Stream_IO.Read(File, Buffer, Last);
         if Last < 2 then
            exit;
         end if;

         -- Check for JPEG segment marker (0xFF)
         if Buffer(1) = 16#FF# then
            Put("Segment marker: ");
            Put_Line(Buffer(2)'Image);
         end if;
      end loop;

   end Dump_Segments;

   procedure Dump_Start_Of_Image_Marker is
   begin
    null;
   end Dump_Start_Of_Image_Marker;

   procedure End_Of_Image is
   begin
    null;
   end End_Of_Image;

   procedure Start_Of_Scan is
   begin
    null;
   end Start_Of_Scan;

   procedure Dump_Marker (MarkerCode : Integer) is
   begin
    case MarkerCode is
         when 16#D8# => Dump_Start_Of_Image_Marker;
         when 16#D9# => End_Of_Image;
         when 16#DA# => Start_Of_Scan;
         when others => raise Constraint_Error with "Unknown marker code";
    end case; 
    end Dump_Marker;

end Jpeg_Reader;
