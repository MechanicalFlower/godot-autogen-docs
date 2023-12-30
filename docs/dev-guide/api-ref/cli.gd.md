<dl class="py class">
    <dt class="sig sig-object py" id="cli.gd">
        <em class="property">
            <span class="pre">class</span>
            <span class="w"> </span>
        </em>
        <span class="sig-prename descclassname">
            <span class="pre">cli.gd</span>
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
            <dt class="sig sig-object py" id="TEMPLATE_DIRECTORY">
                <em class="property">
                    <span class="pre">const</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">TEMPLATE_DIRECTORY</span>
                </span>
            </dt>
            <p></p>
        </dl>

        <dl class="py attribute">
            <dt class="sig sig-object py" id="TemplateEngine">
                <em class="property">
                    <span class="pre">const</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">TemplateEngine</span>
                </span>
            </dt>
            <p></p>
        </dl>

        <dl class="py attribute">
            <dt class="sig sig-object py" id="Collector">
                <em class="property">
                    <span class="pre">const</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">Collector</span>
                </span>
            </dt>
            <p></p>
        </dl>



        <dl class="py attribute">
            <dt class="sig sig-object py" id="directories">
                <em class="property">
                    <span class="pre">var</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">directories</span>
                </span>
            </dt>
            <p>A list of directories to collect files from.</p>
        </dl>

        <dl class="py attribute">
            <dt class="sig sig-object py" id="is_recursive">
                <em class="property">
                    <span class="pre">var</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">is_recursive</span>
                </span>
            </dt>
            <p>If true, explore each directory recursively</p>
        </dl>

        <dl class="py attribute">
            <dt class="sig sig-object py" id="patterns">
                <em class="property">
                    <span class="pre">var</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">patterns</span>
                </span>
            </dt>
            <p>A list of patterns to filter files.</p>
        </dl>

        <dl class="py attribute">
            <dt class="sig sig-object py" id="output_directory">
                <em class="property">
                    <span class="pre">var</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">output_directory</span>
                </span>
            </dt>
            <p>A directory for saving files.</p>
        </dl>


        <dl class="py method">
            <dt class="sig sig-object py" id="_process">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">_process</span>
                </span>
            </dt>
            <p></p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>_delta</strong> (<em>Variant</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>bool</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="generate_reference">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">generate_reference</span>
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
                    <p>Dictionary</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="load_file">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">load_file</span>
                </span>
            </dt>
            <p></p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>path</strong> (<em>String</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>String</p>
                </dd>
            </dl>
        </dl>

        <dl class="py method">
            <dt class="sig sig-object py" id="save_file">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">save_file</span>
                </span>
            </dt>
            <p></p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>content</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>path</strong> (<em>String</em>)</p>
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
            <dt class="sig sig-object py" id="render">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">render</span>
                </span>
            </dt>
            <p></p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">

                        <li>
                            <p><strong>reference</strong> (<em>Dictionary</em>)</p>
                        </li>

                        <li>
                            <p><strong>template_path</strong> (<em>String</em>)</p>
                        </li>

                        <li>
                            <p><strong>output_dirpath</strong> (<em>String</em>)</p>
                        </li>

                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>null</p>
                </dd>
            </dl>
        </dl>


    </dd>
</dl>
