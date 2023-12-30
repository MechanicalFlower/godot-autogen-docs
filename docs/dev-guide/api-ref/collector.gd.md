<dl class="py class">
    <dt class="sig sig-object py" id="collector.gd">
        <em class="property">
            <span class="pre">class</span>
            <span class="w"> </span>
        </em>
        <span class="sig-prename descclassname">
            <span class="pre">collector.gd</span>
        </span>
        <em class="property">
            <span class="w"> </span>
            <span class="pre">extends</span>
            <span class="w"> </span>
        </em>
        <span class="sig-prename descclassname">
            <span class="pre">["SceneTree"]</span>
        </span>
    </dt>
    <dd>
        <p></p>



        <dl class="py attribute">
            <dt class="sig sig-object py" id="warnings_regex">
                <em class="property">
                    <span class="pre">var</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">warnings_regex</span>
                </span>
            </dt>
            <p></p>
        </dl>


        <dl class="py method">
            <dt class="sig sig-object py" id="_init">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">_init</span>
                </span>
            </dt>
            <p></p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>res://addons/godot-autogen-docs/collector.gd</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="find_files">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">find_files</span>
                </span>
            </dt>
            <p>Returns a list of file paths found in the directory.</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>dirpath</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>patterns</strong> (<em>PackedStringArray</em>)</p>
                        </li>

                        <li>
                            <p><strong>is_recursive</strong> (<em>bool</em>)</p>
                        </li>

                        <li>
                            <p><strong>_do_skip_hidden</strong> (<em>bool</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>PackedStringArray</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="save_text">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">save_text</span>
                </span>
            </dt>
            <p>Saves text to a file.</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>path</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>content</strong> (<em>String</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>null</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="get_reference">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">get_reference</span>
                </span>
            </dt>
            <p>Parses a list of GDScript files and returns a list of dictionaries with the code reference data.  If `refresh_cache` is true, will refresh Godot's cache and get fresh symbols.</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>files</strong> (<em>PackedStringArray</em>)</p>
                        </li>

                        <li>
                            <p><strong>refresh_cache</strong> (<em>bool</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>Dictionary</p>
                </dd>
            </dl>
        </dl>


    </dd>
</dl>
